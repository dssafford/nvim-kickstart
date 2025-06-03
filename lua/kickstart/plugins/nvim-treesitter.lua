 return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },

      -- Add Treesitter Textobjects configuration
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['al'] = '@loop.outer',
            ['il'] = '@loop.inner',
            ['ai'] = '@conditional.outer',
            ['ii'] = '@conditional.inner',
            ['ab'] = '@block.outer',
            ['ib'] = '@block.inner',
            ['as'] = '@statement.outer',
            ['is'] = '@statement.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']c'] = '@class.outer',
            [']a'] = '@parameter.outer',
            [']l'] = '@loop.outer',
            [']i'] = '@conditional.outer',
            [']b'] = '@block.outer',
            [']s'] = '@statement.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']C'] = '@class.outer',
            [']A'] = '@parameter.outer',
            [']L'] = '@loop.outer',
            [']I'] = '@conditional.outer',
            [']B'] = '@block.outer',
            [']S'] = '@statement.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[c'] = '@class.outer',
            ['[a'] = '@parameter.outer',
            ['[l'] = '@loop.outer',
            ['[i'] = '@conditional.outer',
            ['[b'] = '@block.outer',
            ['[s'] = '@statement.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[C'] = '@class.outer',
            ['[A'] = '@parameter.outer',
            ['[L'] = '@loop.outer',
            ['[I'] = '@conditional.outer',
            ['[B'] = '@block.outer',
            ['[S'] = '@statement.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a]'] = '@parameter.inner',
            ['<leader>f]'] = '@function.outer',
          },
          swap_previous = {
            ['<leader>a['] = '@parameter.inner',
            ['<leader>f['] = '@function.outer',
          },
        },
      },
    },
  },
}