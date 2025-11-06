local function themeswitch()
  local default_theme = 1
  local themes = {'noctis', 'onedark', 'gruvbox'}
  local current_index = default_theme

  vim.keymap.set('n', '<leader>nt', function()
    current_index = current_index % #themes + 1
    vim.cmd.colorscheme(themes[current_index])
    vim.notify('Theme: ' .. themes[current_index], vim.log.levels.INFO)
  end, { desc = 'Toggle theme' })
end

return {
  {
    'kartikp10/noctis.nvim',
    dependencies = { 'rktjmp/lush.nvim'},
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'noctis'

      -- Only need to include this in one of the themes
      themeswitch()
    end
  },
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    opts = {
    },
    config = function()
      -- this line is required to set onedark default theme to light (see #34 @ github)
      -- DO NOT REMOVE THIS LINE, WILL BREAK CURSOR COLORS
      -- vim.o.background = "light"

      require("onedark").setup {
        style = 'darker',
        transparent = true,

        --toggle theme style--
        toggle_style_key = "<leader>pp",
        toggle_style_list = { 'light', 'warmer', 'darker' },
        -- toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},

        -- Lualine options --
        lualine = {
          transparent = true, -- lualine center bar transparency
        },

      }
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        transparent_mode = true,
      })
      vim.cmd.colorscheme 'gruvbox'
    end
  },
}
