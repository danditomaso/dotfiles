return {

	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedarkpro").setup()

			vim.cmd.colorscheme("onedark_dark")

			-- Hide all semantic highlights until upstream issues are resolved (https://github.com/catppuccin/nvim/issues/480)
			for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
				vim.api.nvim_set_hl(0, group, {})
			end
		end,
	},
}
