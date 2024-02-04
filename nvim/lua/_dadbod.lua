local map = vim.api.nvim_set_keymap
-- vim.g.dbs.o3jbc = 'mysql://root:mysql@localhost:3307/?protocol=tcp'
vim.g.dbs = {
     o3jbc = 'mysql://root:mysql@localhost:3307/?protocol=tcp'
}
map('n', '<leader><C-d>', ':DBUIToggle<CR>', { noremap = true, silent = true })
