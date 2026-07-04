# Disable greeting
set fish_greeting 

# Set Editor to neovim
set -gx EDITOR 'nvim'

# Set neovim as the program to open manpages
set -gx MANPAGER 'nvim +Man!'

# Skip pac CLI telemetry probe (crashes on macOS via WAM broker init)
set -gx PAC_DISABLE_TELEMETRY true

# Add dotfiles directory to PATH for 'dot' command
fish_add_path ~/.dotfiles



# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :


# fnm (Node version manager) — evaluates PATH + enables auto-switch on cd via .nvmrc
fnm env --use-on-cd | source

# pnpm
set -gx PNPM_HOME "/Users/dand/Library/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end
