
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Makes statusline, tabline, and winbar all transparent
vim.cmd [[
  function! Transparent()
    " Statusline of normal and terminal windows
    highlight StatusLine cterm=NONE guifg=NONE guibg=NONE
    highlight StatusLineNC cterm=NONE guifg=NONE guibg=NONE
    highlight StatusLineTerm cterm=NONE guifg=NONE guibg=NONE
    highlight StatusLineTermNC cterm=NONE guifg=NONE guibg=NONE

    " WinbarNC also makes 'not current'(i.e., not focused) winbars transparent"
    highlight WinBar cterm=NONE guifg=NONE guibg=NONE
    highlight WinBarNC cterm=NONE guifg=NONE guibg=NONE

    " Tabs
    highlight TabLine cterm=NONE guifg=NONE guibg=NONE
    highlight TabLineFill cterm=NONE guifg=NONE guibg=NONE
  endfunction

  augroup MakeTransparent
    autocmd!
    autocmd ColorScheme * call Transparent()
  augroup end
]]

vim.cmd [[
  " Can define other highlight overrides here 
  " e.g., highlight TabLineFill cterm=NONE guifg=NONE guibg=NONE
]]
