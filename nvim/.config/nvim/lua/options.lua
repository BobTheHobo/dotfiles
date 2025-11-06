-- [[ Setting options ]]
-- See `:help vim.o`

-- winbar (shows you what file is open at the top of the window)
-- vim.o.winbar = "%=%{ObsessionStatus()} %m %f %y" -- Uses same items as statusline (%= -> right align, %m -> shows modified, %f -> show file, %y is filetype)
-- vim.o.winbar = "%=%{ObsessionStatus()}"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- tab settings
vim.o.softtabstop = 2     -- how many columns pressing or deleting tab is worth
vim.o.tabstop = 2         -- how many columns of whitespace \t (tab) character is worth
vim.o.shiftwidth = 2      -- how many columns of whitespace a "level of indentation" (> or < keystrokes) is worth
vim.o.autoindent = true;  -- automatically indent newlines
vim.o.smartindent = true; -- works with C-like braces
vim.o.expandtab = true    -- expands tab into spaces

-- Set highlight on search
vim.o.hlsearch = false

vim.wo.number = true
-- Make relative line numbers default
vim.wo.relativenumber = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set splits to below current window
vim.o.splitbelow = true;

-- Set splits to right of current window
vim.o.splitright = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Sets powershell to be default shell instead of cmd for windows
local sysname = vim.loop.os_uname().sysname
if sysname == "Windows" then
  vim.o.shell = "powershell.exe"
end

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Sets conceal level to 1 for obsidian.nvim to render checkboxes and other UI elements correctly
vim.o.conceallevel = 2

-- Turns spellcheck on for everything
vim.o.spell = true
vim.o.spelllang = "en"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
