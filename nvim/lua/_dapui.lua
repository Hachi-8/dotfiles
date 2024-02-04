local dapui = require('dapui')
dapui.setup({

})

vim.g.dap_debug = 1
vim.g.dap_debug_output = '~/jbcmemo/tmp.txt'
vim.g.dap_debug_level = 'debug'

local map = vim.api.nvim_set_keymap
  map('n', '<C-e>', ':lua require("dapui").eval(nil, {width=50, enter = true})<CR>', { noremap = true, silent = true })
