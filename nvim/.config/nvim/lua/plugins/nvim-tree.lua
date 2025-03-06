vim.keymap.set("n", "<leader>fe", "<CMD>:NvimTreeToggle<CR>", {desc = "Toggle Tr[e]e"})

-- Change highlights for diagnostics
local function highlights()
  vim.cmd([[
  :hi  link    NvimTreeDiagnosticErrorFileHL  DiagnosticError
  :hi  link    NvimTreeDiagnosticWarnFileHL   DiagnosticWarn
  :hi  link    NvimTreeDiagnosticInfoFileHL   DiagnosticInfo
  :hi  link    NvimTreeDiagnosticHintFileHL   DiagnosticHint
]])
end

local function my_on_attach(bufnr)
  highlights()

  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings (need this otherwise other defaults don't load)
  api.config.mappings.default_on_attach(bufnr)

  -- remove a default
  -- vim.keymap.del("n", "<C-]>", { buffer = bufnr })
  -- override a default
  -- vim.keymap.set("n", "<C-e>", api.tree.reload,                       opts("Refresh"))
  -- add your mappings
  -- vim.keymap.set("n", "?",     api.tree.toggle_help,                  opts("Help"))

  -- Change keybinds
  vim.keymap.set("n", "<leader>fe", api.tree.toggle, {desc = "Toggle Tr[e]e"})

  vim.keymap.set("n", "<leader>tt",          api.node.open.tab,                  opts("Open: New Tab"))

  vim.keymap.set("n", "<leader>tt",          api.node.open.tab,                  opts("Open: New Tab"))
  vim.keymap.set("n", "<leader>|",          api.node.open.vertical,             opts("Open: Vertical Split"))
  vim.keymap.set("n", "<leader>-",          api.node.open.horizontal,           opts("Open: Horizontal Split"))

  vim.keymap.set("n", "[c",             api.node.navigate.git.prev,         opts("Prev Git"))
  vim.keymap.set("n", "]c",             api.node.navigate.git.next,         opts("Next Git"))

  vim.keymap.set("n", "e",              api.tree.collapse_all,              opts("Collapse"))
  vim.keymap.set("n", "E",              api.tree.expand_all,                opts("Expand All"))

  vim.keymap.set("n", "]d",             api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
  vim.keymap.set("n", "[d",             api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))

  vim.keymap.set("n", "g?",             api.tree.toggle_help,               opts("Help"))

  -- Recipe courtesy of @mkalinski @alex-courtis
  -- Changes statusline for tree windows
  api.events.subscribe(api.events.Event.TreeOpen, function()
    local tree_winid = api.tree.winid()

    if tree_winid ~= nil then
      vim.api.nvim_set_option_value('statusline', '%t', {win = tree_winid})
      vim.api.nvim_set_option_value('winbar', ' ', {win = tree_winid})
    end
  end)

end

-- Plugin setup
local function setup()
  require("nvim-tree").setup({
    disable_netrw = true,
    sync_root_with_cwd = false,
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 40,
      number = false,
      relativenumber = false,
    },
    renderer = {
      add_trailing = false,
      group_empty = false,
      hidden_display = "none",

      highlight_git = "none",
      highlight_diagnostics = "all",
      highlight_opened_files = "none",
      highlight_modified = "none",

      icons = {

        git_placement = "right_align",
        modified_placement = "right_align",
        hidden_placement = "after",
        diagnostics_placement = "signcolumn",
        bookmarks_placement = "signcolumn",

        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
          modified = true,
          hidden = false,
          diagnostics = true,
          bookmarks = true,
        },

        glyphs = {
          default = "",
          symlink = "",
          bookmark = "󰆤",
          modified = "●",
          hidden = "󰜌",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            -- unstaged = "✗",
            -- staged = "✓",
            -- unmerged = "",
            -- renamed = "➜",
            -- untracked = "★",
            -- deleted = "",
            -- ignored = "◌",
            unstaged = "U",
            staged = "$",
            unmerged = "",
            renamed = "R",
            untracked = "~",
            deleted = "D",
            ignored = "◌",
          }
        }
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = ""
      }
    },
    modified = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = true,
    },
    filters = {
      enable = false
    },
    actions = {
      expand_all = {
        exclude = { "build", "git", "target"}
      },
      open_file = {
        quit_on_open = false,
        window_picker = {
          exclude = {
            filetype = {
              "notify",
              "packer",
              "qf",
              "diff",
              "fugitive",
              "fugitiveblame",
              "aerial",
              "oil",
              "undotree"
            },
            buftype = {
              -- "nofile",
              "terminal",
              "help",
            },
          }
        }
      }
    },
    on_attach = my_on_attach,
  })
end

-- Recipe courtesy of @mikehaertl
-- Make :bd and :q behave as usual when tree is visible (close nvim-tree as well on quit)
vim.api.nvim_create_autocmd({'BufEnter', 'QuitPre'}, {
  nested = false,
  callback = function(e)
    local tree = require('nvim-tree.api').tree

    -- Nothing to do if tree is not opened
    if not tree.is_visible() then
      return
    end

    -- How many focusable windows do we have? (excluding e.g. incline status window)
    local winCount = 0
    for _,winId in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(winId).focusable then
        winCount = winCount + 1
      end
    end

    -- We want to quit and only one window besides tree is left
    if e.event == 'QuitPre' and winCount == 2 then
      vim.api.nvim_cmd({cmd = 'qall'}, {})
    end

    -- :bd was probably issued an only tree window is left
    -- Behave as if tree was closed (see `:h :bd`)
    if e.event == 'BufEnter' and winCount == 1 then
      -- Required to avoid "Vim:E444: Cannot close last window"
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last buffer used before closing
        tree.toggle({find_file = true, focus = true})
        -- re-open nivm-tree
        tree.toggle({find_file = true, focus = false})
      end, 10)
    end
  end
})

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = setup
}
