-- Set lualine as statusline
return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'onedark',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        -- 'NvimTree', 'undotree',
        winbar = {'aerial', "NvimTree", "undotree", "oil"}
      },
      always_show_tabline = false
    },
    -- lualine at the bottom --
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff'},
      lualine_c = {'diagnostics', 'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {
        { 'selectioncount', padding = { left = 0, right = 1 } },
        { 'searchcount', maxcount = 999, timeout = 500, },
        'location'
      }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },

    -- bar that appears above every buffer --
    winbar = {
      lualine_a = {{'filename', separator = {right = ''}, file_status = true, color = {bg = 'orange'}, }},
      lualine_b = {{'aerial', sep = '' }},
      lualine_c = {},
      lualine_x = {"%{ObsessionStatus()}"},
      lualine_y = {'%m %f %y'},
      lualine_z = {},
    },
    inactive_winbar = {
      lualine_a = {{'filename', file_status = true}},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {"%{ObsessionStatus()}"},
      lualine_y = {'%m %f %y'},
      lualine_z = {},
    },

    -- bar that appears to show tabs

    tabline = {
      lualine_a = {{'tabs', mode = 2, use_mode_colors = true}},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    extensions = {"aerial", "fugitive", "lazy", "mason", "nvim-tree", "oil"},
  },
}
