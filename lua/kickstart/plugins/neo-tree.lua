-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['H'] = 'toggle_hidden', -- Use Shift+H to toggle visibility
        },
      },
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          'node_modules',
          '.git',
          'dist',
          '__pycache__',
        },
        hide_by_pattern = {
          '*.log',
          'tmp/*',
        },
        force_visible_in_filter = true, -- ✅ This makes `/` and `D` work as expected
      },
    },
  },
}