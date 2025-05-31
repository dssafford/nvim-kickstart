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
        -- 👇 Hook into file open to force cwd change
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end
          -- Load default mappings
          api.config.mappings.default_on_attach(bufnr)
          -- Override <CR> to also update global cwd before opening file
          vim.keymap.set("n", "<CR>", function()
            local node = api.tree.get_node_under_cursor()
            if node and node.absolute_path then
              local path = node.absolute_path
              if vim.fn.isdirectory(path) == 0 then
                local dir = vim.fn.fnamemodify(path, ":h")
                vim.cmd("cd " .. vim.fn.fnameescape(dir))
                print("📁 CWD changed to: " .. dir)
              end
              api.node.open.edit()
            end
          end, opts("Open and cd"))
          
          -- Add terminal keybinding that opens terminal in selected directory
          vim.keymap.set("n", "<leader>t", function()
            local node = api.tree.get_node_under_cursor()
            if not node or not node.absolute_path then
              print("⚠️ Not a valid node under cursor")
              return
            end
            local path = node.absolute_path
            if vim.fn.isdirectory(path) == 0 then
              path = vim.fn.fnamemodify(path, ":h")
            end
            -- Open terminal and change to the directory
            vim.cmd("terminal")
            vim.defer_fn(function()
              vim.fn.chansend(vim.b.terminal_job_id, "reset && cd " .. vim.fn.shellescape(path) .. "\n")
            end, 100)
            print("🖥️ Terminal opened in: " .. path)
          end, opts("Open terminal in directory"))
        end,
      })
      -- Toggle nvim-tree
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
      -- Visually change tree root (does not update cwd)
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
      -- Set global CWD to tree node and update all terminals
      vim.keymap.set("n", "<leader>cd", function()
        local api = require("nvim-tree.api")
        local node = api.tree.get_node_under_cursor()
        if not node or not node.absolute_path then
          print("⚠️ Not a valid node under cursor")
          return
        end
        local path = node.absolute_path
        if vim.fn.isdirectory(path) == 0 then
          path = vim.fn.fnamemodify(path, ":h")
        end
        vim.cmd("cd " .. vim.fn.fnameescape(path))
        
        -- Update all open terminals
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" then
            local job_id = vim.b[buf].terminal_job_id
            if job_id then
              vim.fn.chansend(job_id, "reset && cd " .. vim.fn.shellescape(path) .. "\n")
            end
          end
        end
        
        print("📁 Working directory and terminals updated to: " .. path)
      end, { desc = "Set CWD and update terminals", noremap = true, silent = true })
      
      -- Auto-update existing terminals when CWD changes
      vim.api.nvim_create_autocmd("DirChanged", {
        callback = function()
          local new_cwd = vim.fn.getcwd()
          -- Update all open terminals
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" then
              local job_id = vim.b[buf].terminal_job_id
              if job_id then
                vim.fn.chansend(job_id, "reset && cd " .. vim.fn.shellescape(new_cwd) .. "\n")
              end
            end
          end
        end,
      })
    end,
  },
}