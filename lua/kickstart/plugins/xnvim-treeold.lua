return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function custom_on_attach(bufnr)
      local api = require("nvim-tree.api")
      local opts = { buffer = bufnr, noremap = true, silent = true }

      -- Load all default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Explicit h/l keymaps for directory navigation
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts)
      vim.keymap.set("n", "l", api.node.open.edit, opts)

      -- Disable line numbers
      vim.api.nvim_buf_set_option(bufnr, "number", false)
      vim.api.nvim_buf_set_option(bufnr, "relativenumber", false)

      -- Disable <leader>e if it's set by default
      vim.keymap.set("n", "<leader>e", "<Nop>", opts)

       -- Keymap to toggle the tree
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle File Explorer' })
    end

    require("nvim-tree").setup({
      hijack_netrw = true,
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      filters = {
        dotfiles = false,
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        update_root = true,
      },
      view = {
        width = 35,
      },
      on_attach = custom_on_attach,
    })
  end,
}