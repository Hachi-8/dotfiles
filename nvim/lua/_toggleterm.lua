local toggleTerm = require("toggleterm")

toggleTerm.setup()

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction="float", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm direction=float<CR>", {noremap = true, silent = true})

local visidata = Terminal:new({ cmd = "find ~ | fzf | xargs -I@ vd @", direction="float", hidden = true })

function _visidata_toggle()
  visidata:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>v", "<cmd>lua _visidata_toggle()<CR>", {noremap = true, silent = true})

vim.keymap.set('n', '<Leader><C-t>', ':ToggleTerm.toggle direction=horizontal size=10<CR>', {noremap = true,silent = true})
