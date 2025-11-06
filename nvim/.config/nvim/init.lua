-- set <space> as the leader key
-- see `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- set to 1 to disable netrw
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

-- set color overrides before colorscheme is set
require 'colors'

-- Install lazy.nvim
require 'lazy-bootstrap'

-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Better repeats
  'tpope/vim-repeat',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- "gc" to comment visual regions/lines
  'numToStr/Comment.nvim',

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --

  -- Alternatively, use `config = function() ... end` for full control over the configuration.
  -- If you prefer to call `setup` explicitly, use:
  --    {
  --        'lewis6991/gitsigns.nvim',
  --        config = function()
  --            require('gitsigns').setup({
  --                -- Your gitsigns configuration here
  --            })
  --        end,
  --    }

  -- Autocompletion
  {
    -- Main configuration is inside 'cmp-setup'
    'saghen/blink.cmp',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
  },

  -- {
  -- --   -- Theme inspired by Atom
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   opts = {
  --   },
  --   config = function()
  --     -- this line is required to set onedark default theme to light (see #34 @ github)
  --     -- DO NOT REMOVE THIS LINE, WILL BREAK CURSOR COLORS
  --     -- vim.o.background = "light"
  --
  --     require("onedark").setup {
  --       style = 'darker',
  --       transparent = true,
  --
  --       --toggle theme style--
  --       toggle_style_key = "<leader>pp",
  --       toggle_style_list = { 'light', 'warmer', 'darker' },
  --       -- toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},
  --
  --       -- Lualine options --
  --       lualine = {
  --         transparent = true, -- lualine center bar transparency
  --       },
  --
  --     }
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  -- },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup({
  --       terminal_colors = true,
  --       transparent_mode = true,
  --     })
  --     vim.cmd.colorscheme 'gruvbox'
  --   end
  -- },

  {
    'kartikp10/noctis.nvim',
    dependencies = { 'rktjmp/lush.nvim'},
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'noctis'
    end
  },


  -- Fuzzy Finder (files, lsp, etc)
  -- Check 'telescope-setup' for more config
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    -- branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        -- Make sure you have either cmake or make installed
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        cond = function()
          return vim.fn.executable 'cmake' == 1
        end,
        -- If using make, use `build = 'make'` and change `cmake` in cond to `make`
      },

      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  -- Main LSP configuration found in 'lsp-setup'
  -- Don't move from here...
  {
    require 'lsp-setup'
  },

  -- For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  {
    import = "plugins"
  },

},
  -- Stop lazy from notifying every time a change is made
  { change_detection = { notify = false } }
)

-- Options --
require 'options'

-- Keymaps --
require 'keymaps'

-- Telescope --
require 'telescope-setup'

-- Treesitter --
require 'treesitter-setup'

-- Completion (blink.cmp) --
require 'cmp-setup'
