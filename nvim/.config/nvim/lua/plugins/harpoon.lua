local function setup()
  local harpoon = require("harpoon")
  local harpoon_extensions = require("harpoon.extensions")
  local wk = require("which-key")

  -- Required
  harpoon:setup({})

  -- Highlight current file
  harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
  -- Navigate with numbers when quick menu open
  harpoon:extend(harpoon_extensions.builtins.navigate_with_number());

  vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
  vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
  vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
  vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

  vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
  vim.keymap.set("n", "<leader>hd", function() harpoon:list():remove() end)
  vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)


  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<leader>hr", function() harpoon:list():prev() end)
  vim.keymap.set("n", "<leader>he", function() harpoon:list():next() end)


  -- Create vertical/horizontal splits from harpoon
  harpoon:extend({
    UI_CREATE = function(cx)
      vim.keymap.set("n", "<leader>|", function()
        harpoon.ui:select_menu_item({ vsplit = true })
      end, { buffer = cx.bufnr })

      vim.keymap.set("n", "<leader>-", function()
        harpoon.ui:select_menu_item({ split = true })
      end, { buffer = cx.bufnr })

      vim.keymap.set("n", "<leader>t", function()
        harpoon.ui:select_menu_item({ tabedit = true })
      end, { buffer = cx.bufnr })
    end,
  })


  -- basic telescope configuration
  local conf = require("telescope.config").values
  local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
              results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
      }):find()
  end

  vim.keymap.set("n", "<leader>hw", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon window" })


  -- Whichkey bindings
  wk.add({
    { "<leader>1", desc = "Harpoon to 1", mode = "n" },
    { "<leader>2", desc = "Harpoon to 2", mode = "n" },
    { "<leader>3", desc = "Harpoon to 3", mode = "n" },
    { "<leader>4", desc = "Harpoon to 4", mode = "n" },

    { "<leader>ha", desc = "[A]dd to List", mode = "n" },
    { "<leader>hd", desc = "[D]elete from List", mode = "n" },

    { "<leader>hw", desc = "Open Harpoon [W]indow", mode = "n" },
    { "<leader>hh", desc = "Open [H]arpoon Quicklist", mode = "n" },

    { "<leader>he", desc = "Switch to n[e]xt buffer", mode = "n" },
    { "<leader>hr", desc = "Switch to p[r]evious buffer", mode = "n" },

    { "<leader>|", desc = "Open in vert split", mode = "n" },
    { "<leader>-", desc = "Open in horiz split", mode = "n" },
    { "<leader>t", desc = "Open in new tab", mode = "n" },
  })
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = setup
}
