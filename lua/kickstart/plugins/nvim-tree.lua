return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 35,
          relativenumber = true,
        },
        renderer = {
          group_empty = true,
          highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = { "node_modules", ".git" },
        },
        git = {
          enable = true,
          ignore = false,
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true,
          update_root = true,
        },
      })

      -- Keymap to toggle the tree
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle File Explorer' })

      -- C = visually change tree root only (no cwd change)
      vim.keymap.set("n", "C", function()
        local api = require("nvim-tree.api")
        local node = api.tree.get_node_under_cursor()
        if node and node.absolute_path then
          api.tree.change_root(node.absolute_path)
          print("📂 Changed tree root (cwd not updated)")
        else
          print("⚠️ Could not get node under cursor.")
        end
      end, { desc = "Change tree root only", noremap = true, silent = true })

      -- Optional: manually change cwd from current file
 -- <leader>cd = Set CWD to selected directory in tree
vim.keymap.set("n", "<leader>cd", function()
  local api = require("nvim-tree.api")
  local node = api.tree.get_node_under_cursor()

  if not node or not node.absolute_path then
    print("⚠️ Not a valid node under cursor")
    return
  end

  local path = node.absolute_path

  -- If cursor is on a file, go to its parent
  if vim.fn.isdirectory(path) == 0 then
    path = vim.fn.fnamemodify(path, ":h")
  end

  vim.cmd("cd " .. vim.fn.fnameescape(path))
  print("📁 Working directory set to: " .. path)
end, { desc = "Set CWD to tree node", noremap = true, silent = true })
    end,
  },
}