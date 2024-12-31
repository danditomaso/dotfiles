return {
  -- add vscode modern dark
  { 'projekt0n/github-nvim-theme' },

  -- Configure LazyVim to load vscode modern dark
  {
    "LazyVim/LazyVim",
    config = function()
    require('github-theme').setup({
      -- ...
    })

    vim.cmd('colorscheme github_dark_default')
  end,

  }
}
