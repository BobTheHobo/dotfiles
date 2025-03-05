local opts = {
  window = {
    backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 110, -- width of the Zen window
    height = 0.85, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursfalseorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      -- ruler = false, -- disables the ruler text in the cmd line area
      -- showcmd = false, -- disables the command in the last line of the screen
      -- you may turn on/off statusline in zen mode by setting 'laststatus' 
      -- statusline will be shown only if 'laststatus' == 3
      laststatus = 0, -- turn off the statusline in zen mode
    },
    twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
    -- gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    todo = { enabled = true }, -- if set to "true", todo-comments.nvim highlights will be disabled
    -- TODO: FEAOIOJ
  },
  on_open = function()
    vim.cmd('echo "ZenMode on"')
    vim.fn.system([[tmux set status off]])
    vim.fn.system([[tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z]])
  end,
  on_close = function()
    vim.cmd('echo "ZenMode off"')
    require('lualine').hide({
      place = {'winbar'},
      unhide = true
    })
    vim.fn.system([[tmux set status on]])
    vim.fn.system([[tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z]])
  end
}

local function setup()
  local hide_winbar_tabs = function()
    require('lualine').hide(
      {
        place = { 'tabline', 'winbar' }, -- The segment this change applies to.
        unhide = false,
      })
  end

  vim.keymap.set("n", "<leader>zz", function()
    hide_winbar_tabs()
    require("zen-mode").toggle()
  end)

  require("which-key").add({
    {"<leader>zz", desc = "Toggle [Z]en Mode", mode = "n"}
  })

  require("zen-mode").setup(opts)

end

return {
  "folke/zen-mode.nvim",
  config = setup
}
