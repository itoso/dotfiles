
"-------------------------------------------------------------------------------
" カラー関連 Colors
"-------------------------------------------------------------------------------
colorscheme desert
hi clear CursorLine
highlight CursorLine ctermbg=black guibg=black

if has('gui_macvim')
    set transparency=3
    set lines=90 columns=200
    set guioptions-=T
endif
