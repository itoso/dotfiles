" vimモード
if &compatible
  set nocompatible
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/so.ito/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/so.ito/.vim/bundles')
  call dein#begin('/Users/so.ito/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/so.ito/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/denite.nvim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('w0rp/ale')

  " TO install : ":call dein#install()"

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable


"-------------------------------------------------------------------------------
" 基本設定 Basics
"-------------------------------------------------------------------------------

set scrolloff=5                  " スクロール時の余白確保
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set nowritebackup
set noswapfile                   " スワップファイル作らない
set autoread                     " 他で書き換えられたら自動で読み直す
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set novisualbell
set browsedir=buffer             " Exploreの初期ディレクトリ
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効


" OSのクリップボードを使用する
set clipboard+=unnamed

" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Sv source $MYVIMRC
command! Eg edit $MYGVIMRC
command! Sg source $MYGVIMRC

" ファイルタイプ判定をon
filetype plugin on



"-------------------------------------------------------------------------------
" 表示 Apperance
"-------------------------------------------------------------------------------
set showmatch         " 括弧の対応をハイライト
set matchtime=3         " 対応括弧のハイライト表示を3秒にする
set number            " 行番号表示
set list              " 不可視文字表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲" 不可視文字の表示形式
set display=uhex      " 印字不可能文字を16進数で表示

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カーソル行をハイライト
set cursorline

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
highlight CursorLine ctermbg=black guibg=black

" コマンド実行中は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast



"-------------------------------------------------------------------------------
" エンコーディング関連 Encoding
"-------------------------------------------------------------------------------
set ffs=unix,dos,mac  " 改行文字
set encoding=utf-8    " デフォルトエンコーディング



"-------------------------------------------------------------------------------
" 検索設定 Search
"-------------------------------------------------------------------------------
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト
"Escの2回押しでハイライト消去
nmap <silent> <ESC><ESC> :nohlsearch<CR>



"-------------------------------------------------------------------------------
" ステータスライン StatusLine
"-------------------------------------------------------------------------------
set laststatus=2 " 常にステータスラインを表示

"カーソルが何行目の何列目に置かれているかを表示する
set ruler




"-------------------------------------------------------------------------------
" インデント Indent
"-------------------------------------------------------------------------------
set autoindent   " 自動でインデント
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める
set shiftround   " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab


"-------------------------------------------------------------------------------
" キーマッピング
"-------------------------------------------------------------------------------

" denite
nnoremap [Denite] <nop>
nmap <space>d [Denite]

nnoremap [Denite]f :<C-u>Denite file<CR>
nnoremap [Denite]b :<C-u>Denite buffer<CR>
nnoremap [Denite]l :<C-u>Denite line<CR>
nnoremap [Denite]g :<C-u>Denite grep<CR>
nnoremap [Denite]r :<C-u>Denite file_mru<CR>
nnoremap [Denite]<C-r> :<C-u>Denite register<CR>

