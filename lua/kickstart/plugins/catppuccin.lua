-- Catppuccin Theme
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = true,
        which_key = true,
        dap = { enabled = true, enable_ui = true },
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}