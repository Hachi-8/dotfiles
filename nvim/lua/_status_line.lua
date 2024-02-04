
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'iceberg_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {
        'nerdtree'
      },
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'searchcount', 'selectioncount','encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {},
  tabline = {
    lualine_a = {'tabs'},
    lualine_b = {''},
    lualine_c = {''},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {''}
  },
  winbar = {
    lualine_a = {''},
    lualine_b = {''}
  },
  inactive_winbar = {
    lualine_a = {''},
    lualine_b = {''}
  },
  extensions = {}
}

