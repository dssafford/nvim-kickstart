return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },

  -- 👇 Add this block for which-key/Lazy.nvim keymaps
keys = {
  -- Group label for Obsidian
  { "<leader>n", group = "Obsidian" },

  -- Core functionality
  { "<leader>nn", "<cmd>ObsidianNew<CR>", desc = "New Note" },
  { "<leader>ns", "<cmd>ObsidianSearch<CR>", desc = "Search Notes" },
  { "<leader>nf", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick Switch" },
  { "<leader>nb", "<cmd>ObsidianBacklinks<CR>", desc = "Backlinks" },
  { "<leader>nl", "<cmd>ObsidianFollowLink<CR>", desc = "Follow Link Under Cursor" },
  { "<leader>no", "<cmd>ObsidianOpen<CR>", desc = "Open in Obsidian App" },

  -- Daily Notes
  { "<leader>nt", "<cmd>ObsidianToday<CR>", desc = "Today’s Daily Note" },
  { "<leader>ny", "<cmd>ObsidianYesterday<CR>", desc = "Yesterday’s Daily Note" },

  -- Optional extras (only if you use them)
  { "<leader>nd", "<cmd>ObsidianDailies<CR>", desc = "Open All Daily Notes" },
  { "<leader>np", "<cmd>ObsidianPasteImg<CR>", desc = "Paste Image from Clipboard" },
},
  opts = function()
    vim.opt.conceallevel = 2

    return {
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/Obsidian/DougVault",
        },
      },
      notes_subdir = "_Inbox",
      daily_notes = {
        folder = "Daily",
        date_format = "%Y-%m-%d",
      },
      finder = "telescope.nvim",
      completion = {
        nvim_cmp = true,
      },
      note_id_func = function(title)
        return title and title:lower():gsub(" ", "-"):gsub("[^a-z0-9-]", "")
          or tostring(os.time())
      end,
      follow_url_func = function(url)
        vim.fn.jobstart({ "open", url })
      end,
    }
  end,
}
