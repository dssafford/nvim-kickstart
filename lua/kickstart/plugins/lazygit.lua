return {
  "kdheepak/lazygit.nvim",
  cmd = "LazyGit",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>gg",
      function()
        -- Optional: set cwd before opening LazyGit
        local cwd = vim.fn.expand("%:p:h")
        vim.cmd("cd " .. cwd)
        vim.cmd("LazyGit")
      end,
      desc = "Open LazyGit in current file's directory",
    },
  },
  config = function()
    -- Optional: floating window styling
    vim.g.lazygit_floating_window_winblend = 0
    vim.g.lazygit_floating_window_scaling_factor = 1.0
    vim.g.lazygit_floating_window_border_chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }
  end,
}