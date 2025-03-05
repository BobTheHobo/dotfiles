vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "]w", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING", "FIX" }})
end, { desc = "Next error/warning/fix todo comment" })

vim.keymap.set("n", "[w", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING", "FIX" }})
end, { desc = "Previous error/warning/fix todo comment" })

vim.keymap.set("n", "<leader>fo", "<cmd>TodoTelescope cwd=./ keywords=TODO,FIX,ERROR<CR>", { desc = "[F]ind t[O]do" })

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {}
}
