-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Makes statusline, tabline, and winbar all transparent
vim.cmd [[
  function! Transparent()

    " Transparent Background
    highlight Normal cterm=NONE guibg=NONE
    highlight NormalNC cterm=NONE guibg=NONE
    highlight NormalFloat cterm=NONE guibg=NONE
    highlight FloatBorder cterm=NONE guibg=NONE
    highlight Pmenu cterm=NONE guibg=NONE
    highlight NonText cterm=NONE guibg=NONE

    " Statusline of normal and terminal windows
    highlight StatusLine cterm=NONE guifg=NONE guibg=NONE
    highlight StatusLineNC cterm=NONE guifg=NONE guibg=NONE
    highlight StatusLineTerm cterm=NONE guifg=NONE guibg=NONE
    highlight StatusLineTermNC cterm=NONE guifg=NONE guibg=NONE

    " WinbarNC also makes 'not current'(i.e., not focused) winbars transparent"
    highlight WinBar cterm=NONE guifg=NONE guibg=NONE gui=NONE
    highlight WinBarNC cterm=NONE guifg=NONE guibg=NONE

    " Tabs
    highlight TabLine cterm=NONE guifg=NONE guibg=NONE
    highlight TabLineFill cterm=NONE guifg=NONE guibg=NONE

    " Comments
    highlight Comment guifg=afb1b3

  endfunction

  augroup MakeTransparent
    autocmd!
    autocmd ColorScheme * call Transparent()
  augroup end
]]
