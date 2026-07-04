return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			delay = 400,
			filter = function(mapping)
				return mapping.desc ~= "Disable space (leader) in normal mode"
			end,
			spec = {
				{ "<leader>g", group = "git" },
				{ "<leader>h", group = "hunk" },
			},
		},
	},
}
