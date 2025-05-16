return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 35,
          relativenumber = true,
        },
        renderer = {
          group_empty = true,
          highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = { "node_modules", ".git" },
        },
        git = {
          enable = true,
          ignore = false,
        },
      }

      -- Keymap to toggle the tree
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle File Explorer' })
    end,
  },
}