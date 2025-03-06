-- [[ Basic Keymaps ]]

-- Keymaps for better default experience

-- For the options (last {} in keymap.set):
-- "desc=" -> Describes the function for which-key.nvim
-- "silent=" -> Executes without showing function in statusline
-- "expr=" -> Executes the return of a function

-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Automatically source vimrc
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>', { desc = 'Source vimrc' })

-- Toggle search highlighting
vim.keymap.set('n', '<F4>', ':set hls!<CR>', { desc = 'Toggle search highlighting', silent = true })
vim.keymap.set('n', '/', ':set hlsearch<CR>/', { silent = true }) -- Turns on search highlighting on a search

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Insert blank lines --
vim.keymap.set('n', '<leader>o', 'mao<Esc>`a', { silent = true, desc = "Inserts blank line below" })
vim.keymap.set('n', '<leader>O', 'maO<Esc>`a', { silent = true, desc = "Inserts blank line above" })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Terminal
vim.keymap.set("n", "<leader>ft", "<C-W>s15<C-W>_:terminal<cr>", { desc = "Terminal (root dir)" })
vim.keymap.set("n", "<leader>fT", "<cmd>tabnew<cr><C-W>s15<C-W>_:terminal<cr>", { desc = "Terminal in new tab (root dir)" })
vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Terminal remappings
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
vim.keymap.set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Move to window using the <ctrl> hjkl keys
-- Uses vim-tmux-navigator to enable switching between nvim and tmux panes as well
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Go to lower window", remap = true })
-- the c-k keymap to go up also conflicts with documentation viewing, but I'm leaving it for now
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
-- just use tmux for tabs
vim.keymap.set("n", "<leader>tt", ":tabnew <CR>", { desc = "New [t]ab"})
vim.keymap.set("n", "<leader>tx", ":tabclose <CR>", { desc = "Close tab"})
vim.keymap.set("n", "<leader>te", ":tabnext <CR>", { desc = "N[e]xt tab"})
vim.keymap.set("n", "<leader>tr", ":tabprevious <CR>", { desc = "P[r]evious tab"})
vim.keymap.set("n", "<leader>t1", ":tabfirst <CR>", { desc = "First tab"})
vim.keymap.set("n", "<leader>t0", ":tablast <CR>", { desc = "Last tab"})
