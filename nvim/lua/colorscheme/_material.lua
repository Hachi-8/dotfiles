vim.g.material_style = 'deep ocean'
require('material').setup({
  contrast = {
    floating_windows = true,
    lsp_virtual_text = true
  },

  high_visibility = {
    darker = true,
  },

  plugins = {
    "dap",
  }
})


vim.cmd 'colorscheme material'
