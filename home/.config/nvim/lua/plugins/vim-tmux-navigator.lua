return {
	{
		"christoomey/vim-tmux-navigator",
		-- Lazy-load on the navigation commands our keymaps call (see keymaps.lua).
		-- lazy.nvim registers command stubs during setup, so the
		-- `exists(":TmuxNavigate*")` guard in keymaps.lua resolves on first use.
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		init = function()
			-- We define our own <C-hjkl> mappings in keymaps.lua, so disable the
			-- plugin's default mappings to avoid double-binding.
			vim.g.tmux_navigator_no_mappings = 1
			-- Preserve prior behaviour: don't navigate out of a zoomed tmux pane.
			vim.g.tmux_navigator_disable_when_zoomed = 1
		end,
	},
}
