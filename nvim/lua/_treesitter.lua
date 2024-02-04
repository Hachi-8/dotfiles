local treesitter = require('nvim-treesitter.configs')

treesitter.setup{
  highlight = {
    enable = true,
    disable = {},
  },
  ensure_installed = 'all',
  autotag = {
    enable = true
  }
}
