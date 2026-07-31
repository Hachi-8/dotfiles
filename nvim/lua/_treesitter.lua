local treesitter = require('nvim-treesitter.configs')

treesitter.setup{
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  ensure_installed = 'all',
  autotag = {
    enable = true
  },
  indent = {
    enable = false
  }
}

vim.treesitter.language.register('tsx', 'typescript')
