local function setup()
  vim.keymap.set("n", "<leader>fu", vim.cmd.UndotreeToggle)
  require('which-key').add({"<leader>fu", desc = "Toggle Undotree", mode = "n"})
end

return {
  "mbbill/undotree",
  opts = {
    window_layout = 2
  },
  config = setup
}
