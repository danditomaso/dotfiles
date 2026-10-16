# Plain shell panes fire no herdr hook on cd or checkout, so nudge the tab autoname plugin.
if set -q HERDR_PANE_ID; and status is-interactive
    function __herdr_tab_autoname --on-variable PWD
        ~/.config/herdr/plugins/tab-autoname/autoname.sh $HERDR_PANE_ID &>/dev/null &
        disown 2>/dev/null
    end

    function __herdr_tab_autoname_git --on-event fish_postexec
        string match -qr '^\s*(git|gt|jj)\s' -- $argv[1]; and __herdr_tab_autoname
    end
end
