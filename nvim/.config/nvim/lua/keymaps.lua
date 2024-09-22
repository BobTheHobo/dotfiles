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

-- Move lines up and down by using <Alt-k> and <Alt-j> respectively
vim.keymap.set('n', '<A-j>', ':m +1<CR>==', { silent = true, desc = "Moves a line down" })
vim.keymap.set('n', '<A-k>', ':m -2<CR>==', { silent = true, desc = "Moves a line up" })
vim.keymap.set('i', '<A-j>', '<Esc>:m +1<CR>==gi', { silent = true, desc = "Moves a line down (insert mode)" })
vim.keymap.set('i', '<A-k>', '<Esc>:m -2<CR>==gi', { silent = true, desc = "Moves a line up (insert mode)" })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { silent = true, desc = "Moves a line down (visual mode)" })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { silent = true, desc = "Moves a line up (visual mode)" })

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
vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Terminal remappings
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
vim.keymap.set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

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
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
vim.keymap.set("n", "<A-n>", ":tabnew <CR>")
vim.keymap.set("n", "<A-t>", ":vsplit <CR>")
vim.keymap.set("n", "<A-w>", ":tabclose <CR>")
vim.keymap.set("n", "<A-h>", ":tabprevious <CR>", { silent = true })
vim.keymap.set("n", "<A-l>", ":tabnext <CR>", { silent = true })
vim.keymap.set("n", "<A-Left>", ":tabprevious <CR>", { silent = true })
vim.keymap.set("n", "<A-Right>", ":tabnext <CR>", { silent = true })
vim.keymap.set("n", "<A-1>", ":tabfirst <CR>", { silent = true })
vim.keymap.set("n", "<A-0>", ":tablast <CR>", { silent = true })
