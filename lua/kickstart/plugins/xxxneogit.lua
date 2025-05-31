return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- Required
    "sindrets/diffview.nvim",        -- Optional - Diff integration
    "nvim-telescope/telescope.nvim", -- Optional - Telescope integration
  },
  config = function()
    require("neogit").setup({
      integrations = {
        diffview = true,
        telescope = true,
      },
    })
  end,
  keys = {
    { "<leader>gg", function() require("neogit").open() end, desc = "Open Neogit" },
    { "<leader>gc", "<cmd>Neogit commit<CR>", desc = "Git Commit" },
    { "<leader>gp", "<cmd>Neogit push<CR>", desc = "Git Push" },
    { "<leader>gP", "<cmd>Neogit pull<CR>", desc = "Git Pull" },
    { "<leader>gl", "<cmd>Neogit log<CR>", desc = "Git Log" },
    { "<leader>gd", "<cmd>Neogit diff<CR>", desc = "Git Diff" },
    { "<leader>gs", "<cmd>Neogit stash<CR>", desc = "Git Stash" },
    { "<leader>ga", "<cmd>Neogit add .<CR>", desc = "Git Add All" }, -- Optional
  },
}