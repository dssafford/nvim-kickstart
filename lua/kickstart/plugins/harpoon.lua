return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim', -- Optional: Telescope integration
  },
  lazy = false,
  keys = {
      { "<leader>ha", function() require("harpoon"):list():append() end, desc = "Harpoon Add File" },
    { "<leader>hm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Toggle Menu" },
    { "<leader>hc", function() require("harpoon"):list():clear() end, desc = "Harpoon Clear All Files" },
    { "<leader>hn", function() require("harpoon"):list():next() end, desc = "Harpoon Next File" },
    { "<leader>hp", function() require("harpoon"):list():prev() end, desc = "Harpoon Previous File" },
    { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "Harpoon File 1" },
    { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "Harpoon File 2" },
    { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "Harpoon File 3" },
    { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "Harpoon File 4" },
  },
config = function()
  local harpoon = require("harpoon")

  harpoon:setup() -- Always call this, even if you're not passing options

  -- Configure the default list's persistence settings
  local list = harpoon:list()
  list.config.save_on_toggle = true
  list.config.save_on_change = true
  list.config.sync_on_ui_close = true

  -- set marks specific to each git branch inside git repository
  list.config.mark_branch = false,
  
  -- Optional: Telescope integration
  pcall(require("telescope").load_extension, "harpoon")
end,
}