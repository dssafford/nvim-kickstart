return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim", -- optional but recommended
  },
  config = function()
    require("neogit").setup()
  end,
  keys = {
    { "<leader>gn", function() require("neogit").open() end, desc = "Neogit Status" },
  },
  cmd = { "Neogit" }, -- Allows Lazy to load on :Neogit command
}