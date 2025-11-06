-- local aerial = require("aerial")
--
-- local filter_on = false
-- local filter_list = {
--     "Class",
--     "Constructor",
--     "Function",
--     "Method",
--     "Module",
--     "Namespace",
--     "Package"
--   }
--
-- function ToggleFilter()
--   filter_on = not filter_on
--   if filter_on then
--     aerial.setup({
--       filter_kind = filter_list
--     })
--   else
--     aerial.setup({
--       filter_kind = false
--     })
--   end
-- end
-- vim.keymap.set("n", "<leader>faf", ToggleFilter, { desc = "Toggle [a]erial [f]ilters"})

vim.keymap.set("n", "<leader>fa", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial"})

return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("aerial").setup({
      -- This can be a filetype map (see :help aerial-filetype-map)
      backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },

      -- Determines the default direction to open the aerial window. The 'prefer'
      -- options will open the window in the other direction *if* there is a
      -- different buffer in the way of the preferred direction
      -- Enum: prefer_right, prefer_left, right, left, float
      default_direction = "prefer_right",

      -- Don't filter out anything
      filter_kind = false,

      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    })
  end
}
