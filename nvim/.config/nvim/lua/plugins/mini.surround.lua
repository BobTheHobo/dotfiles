vim.keymap.set({ "n", "x" }, "s", "<Nop>") -- Unbind default substitute

return {
  "echasnovski/mini.surround",
  opts = {
    highlight_duration = 2000,

    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      add = 'sa', -- Add surrounding in Normal and Visual modes
      delete = 'sd', -- Delete surrounding
      find = 'sf', -- Find surrounding (to the right)
      find_left = 'sF', -- Find surrounding (to the left)
      highlight = 'sh', -- Highlight surrounding
      replace = 'sr', -- Replace surrounding

      suffix_last = 'l', -- Suffix to search with "prev" method
      suffix_next = 'n', -- Suffix to search with "next" method
    },
    respect_selection_type = true
  },
}
