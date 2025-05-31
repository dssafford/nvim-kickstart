return {
  "fnune/recall.nvim",
  config = function()
    local recall = require("recall")
    
    recall.setup({
      -- Configuration options here
      telescope = {
        mappings = {
          unmark = "<C-x>",
        },
      },
    })
    
    -- Set up keybindings
    vim.keymap.set("n", "<leader>mm", recall.toggle, { desc = "Toggle recall mark" })
    vim.keymap.set("n", "<leader>mn", recall.goto_next, { desc = "Go to next mark" })
    vim.keymap.set("n", "<leader>mp", recall.goto_prev, { desc = "Go to previous mark" })
    vim.keymap.set("n", "<leader>mc", recall.clear, { desc = "Clear all marks" })
    vim.keymap.set("n", "<leader>ml", ":Telescope recall<CR>", { desc = "List all marks" })
  end,
}