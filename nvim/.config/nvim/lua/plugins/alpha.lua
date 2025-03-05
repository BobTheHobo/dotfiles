return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'echasnovski/mini.icons',
        'nvim-lua/plenary.nvim'
    },
    config = function()
        -- Default Theme
        -- local startify = require("alpha.themes.startify")
        -- startify.file_icons.provider = "devicons"
        -- require("alpha").setup(
        --     startify.config
        -- )

        -- Dashboard-nvim theme
        -- require 'alpha'.setup(require 'alpha.themes.dashboard'.config)

        -- Theta theme
        require 'alpha'.setup(require 'alpha.themes.theta'.config)
    end,
};
