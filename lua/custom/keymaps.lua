vim.keymap.set('n', '<leader>cb', 'i- [ ] <Esc>', { desc = 'Insert checkbox', noremap = true })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move between windows using Ctrl + Arrow keys
vim.keymap.set('n', '<C-Up>', '<C-w><C-k>', { desc = 'Move to window above' })
vim.keymap.set('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move to window below' })
vim.keymap.set('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move to right window' })

--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('t', 'jj', [[<C-\><C-n>]], { desc = 'jj to exit terminal mode' })
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'jj to escape insert mode' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<leader>xx', function()
  require('telescope.builtin').find_files {
    cwd = vim.fn.stdpath 'config',
  }
end, { desc = '[X]plore dotfiles' })

