return {
  "echasnovski/mini.nvim",
  version = false, -- use latest
  config = function()
    require("mini.ai").setup()
    require("mini.comment").setup()
    require("mini.clue").setup()
    require("mini.jump").setup()
    require("mini.pairs").setup()
    require("mini.surround").setup()
    require("mini.statusline").setup()
    require("mini.files").setup()
    require("mini.bufremove").setup()
    require("mini.indentscope").setup({
      symbol = "│",
      options = { try_as_border = true },
    })

    require("mini.starter").setup({
      header = table.concat({
        "     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣤⣄⣀  ",
        "     ⠀⠀⠀⠀⠀⠀⠀⠀  Welcome to Neovim, Doug ⠀⠀⠀⠀ ",
        "     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⠿⠿⠋⠁  ",
      }, "\n"),
      items = {
        require("mini.starter").sections.builtin_actions(),
        require("mini.starter").sections.recent_files(5, true),
        {
          name = "Open 2-pane layout",
          action = "OpenTwoPane",
          section = "Custom",
        },
        {
          name = "Browse Files",
          action = "lua MiniFiles.open()",
          section = "Explorer",
        },
      },
      footer = "🚀 Powered by mini.nvim",
      content_hooks = {
        require("mini.starter").gen_hook.aligning("center", "center"),
      },
    })

    -- Custom two-pane layout: file tree + code pane
    vim.api.nvim_create_user_command("OpenTwoPane", function()
      vim.cmd('silent! %bwipeout')      -- Close all buffers
      vim.cmd('enew')                   -- New empty buffer

      -- 1. Open nvim-tree on the left
      require('nvim-tree.api').tree.open()

      -- 2. Move to the code pane on the right
      vim.cmd('wincmd l')
    end, {})
  end,
}