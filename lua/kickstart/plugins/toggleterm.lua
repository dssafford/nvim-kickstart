return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("toggleterm").setup({
      direction = "horizontal",
      size = 15,
      start_in_insert = true,
      shade_terminals = true,
    })

    -- Manual keymap to open terminal in correct cwd
    vim.keymap.set("n", "<C-t>", function()
      local cwd = vim.fn.getcwd()
      local Terminal = require("toggleterm.terminal").Terminal

      local term = Terminal:new({
        cmd = "zsh",
        dir = cwd,
        count = 1,
        direction = "horizontal",
        hidden = false,
      })

      term:open()
    end, { noremap = true, silent = true })

    -- Optional: make <Esc> exit terminal mode
    vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
  end,
}