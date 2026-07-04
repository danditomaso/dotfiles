return {
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		keys = {
			{ "<leader>gs", "<cmd>Neogit<cr>", desc = "Git status (Neogit)" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},
}
