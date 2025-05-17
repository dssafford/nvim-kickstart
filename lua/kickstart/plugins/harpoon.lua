return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim', -- Optional: Telescope integration
  },
  lazy = false,
  keys = {
    { '<leader>ha', function() require('harpoon'):list():add() end, desc = 'Harpoon add file' },
    { '<leader>ht', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, desc = 'Harpoon toggle menu' },
    { '<leader>h1', function() require('harpoon'):list():select(1) end, desc = 'Harpoon file 1' },
    { '<leader>h2', function() require('harpoon'):list():select(2) end, desc = 'Harpoon file 2' },
    { '<leader>h3', function() require('harpoon'):list():select(3) end, desc = 'Harpoon file 3' },
    { '<leader>h4', function() require('harpoon'):list():select(4) end, desc = 'Harpoon file 4' },
    { '<leader>hp', function() require('harpoon'):list():prev() end, desc = 'Harpoon prev file' },
    { '<leader>hn', function() require('harpoon'):list():next() end, desc = 'Harpoon next file' },
    { '<leader>hm', "<cmd>Telescope harpoon marks<CR>", desc = "Telescope Harpoon Marks" },
  },
config = function()
  local harpoon = require("harpoon")

  harpoon:setup() -- Always call this, even if you're not passing options

  -- Configure the default list's persistence settings
  local list = harpoon:list()
  list.config.save_on_toggle = true
  list.config.save_on_change = true
  list.config.sync_on_ui_close = true

  -- Optional: Telescope integration
  pcall(require("telescope").load_extension, "harpoon")
end,
}