-- Keybinds ported from ghostty (home/.config/ghostty/config), which were
-- ported from tmux. Rex's own defaults stay active alongside these.

-- Splits
rex.bind("ctrl+shift+\\", "pane.split.right")
rex.bind("ctrl+-", "pane.split.down")
rex.bind("ctrl+shift+s", "pane.split.auto")
rex.bind("ctrl+alt+h", "pane.split.left")
rex.bind("ctrl+alt+j", "pane.split.down")
rex.bind("ctrl+alt+k", "pane.split.up")
rex.bind("ctrl+alt+l", "pane.split.right")

-- Resize. ctrl+[ is ESC, so left sits on ctrl+shift+[
rex.bind("ctrl+=", "pane.resize", { direction = "up", amount = 2 })
rex.bind("ctrl+]", "pane.resize", { direction = "right", amount = 2 })
rex.bind("ctrl+shift+[", "pane.resize", { direction = "left", amount = 2 })
rex.bind("ctrl+delete", "pane.balance")

-- Pane lifecycle
rex.bind("ctrl+shift+x", "pane.close")
rex.bind("ctrl+shift+m", "pane.zoom")
rex.bind("ctrl+shift+r", "client.config.reload")

-- Pane navigation. Plain ctrl+h/j/k/l is left for vim and fish
rex.bind("ctrl+shift+h", "pane.focus.left")
rex.bind("ctrl+shift+j", "pane.focus.down")
rex.bind("ctrl+shift+k", "pane.focus.up")
rex.bind("ctrl+shift+l", "pane.focus.right")
rex.bind("ctrl+shift+p", "pane.focus_previous")
rex.bind("ctrl+shift+space", "pane.focus_next")
