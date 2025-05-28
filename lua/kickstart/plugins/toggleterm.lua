return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-t>]],
      direction = "horizontal",
      size = 15,
      start_in_insert = true,
      shade_terminals = true,
    })

    -- Optional: make <Esc> exit terminal mode
    vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
  end,
}
