vim.g.material_style = 'deep ocean'
require('material').setup({
  contrast = {
    floating_windows = true,
  },

  high_visibility = {
    darker = true,
  }
})


vim.cmd 'colorscheme material'
