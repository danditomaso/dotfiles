#!/bin/sh
# Usage: autoname.sh [pane_id]. Defaults to $HERDR_PANE_ID.
PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
herdr="${HERDR_BIN_PATH:-herdr}"
pane="${1:-$HERDR_PANE_ID}"
[ -n "$pane" ] || exit 0
state_dir="${HERDR_PLUGIN_STATE_DIR:-$HOME/.local/state/herdr/plugins/local.tab-autoname}"
mkdir -p "$state_dir"

info=$("$herdr" pane get "$pane" 2>/dev/null) || exit 0
tab=$(printf '%s' "$info" | jq -r '.result.pane.tab_id // empty')
agent=$(printf '%s' "$info" | jq -r '.result.pane.agent // empty')
title=$(printf '%s' "$info" | jq -r '.result.pane.terminal_title_stripped // empty')
dir=$(printf '%s' "$info" | jq -r '.result.pane.foreground_cwd // .result.pane.cwd // empty')
[ -n "$tab" ] || exit 0

label=""
case "$title" in
  "" | "Claude Code" | "$agent") ;;
  *) [ -n "$agent" ] && label="$title" ;;
esac

if [ -z "$label" ] && [ -n "$dir" ]; then
  if root=$(git -C "$dir" rev-parse --show-toplevel 2>/dev/null); then
    branch=$(git -C "$dir" branch --show-current 2>/dev/null)
    [ -n "$branch" ] || branch=$(git -C "$dir" rev-parse --short HEAD 2>/dev/null)
    label="$(basename "$root"):$branch"
  else
    label=$(basename "$dir")
  fi
fi
[ -n "$label" ] || exit 0
label=$(printf '%s' "$label" | cut -c1-40)

current=$("$herdr" tab get "$tab" 2>/dev/null | jq -r '.result.tab.label // empty')
state_file="$state_dir/$(printf '%s' "$tab" | tr -c 'A-Za-z0-9_-' '_')"
last_auto=$(cat "$state_file" 2>/dev/null)

[ "$current" = "$label" ] && exit 0
# Only touch default numeric labels or ones this script set; anything else was named by hand.
case "$current" in
  "" | *[!0-9]*) [ "$current" = "$last_auto" ] || exit 0 ;;
esac

"$herdr" tab rename "$tab" "$label" >/dev/null 2>&1 && printf '%s' "$label" > "$state_file"
