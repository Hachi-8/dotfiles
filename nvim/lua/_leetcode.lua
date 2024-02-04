local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader><C-l>', ':LeetCodeList<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<leader><C-t> :LeetCodeTest<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<leader><C-s> :LeetCodeSubmit<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<leader><C-S> :LeetCodeSignIn<CR>', default_opts)
