" Bundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on
" End Bundle setup

syntax on

" カラーテーマ
set background=dark
colorscheme iceberg

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 描画更新間隔を設定
set updatetime=250
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" すべての数を10進数として扱う
set nrformats=
" バッファスクロール
set mouse=a
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" 数字のインクリメント・デクリメントを+,-に設定
nnoremap + <C-a>
nnoremap - <C-x>

" 見た目系
" 行番号を表示
set number
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
set matchtime=1
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmenu
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" マッピング Y を、行末までのヤンクにする
nnoremap Y y$
" カーソル位置を表示
set ruler
" メッセージ表示欄を2行確保
set cmdheight=2
" 省略されずに表示
set display=lastline
" コメントの色を水色
" hi Comment ctermfg=3
" タイトルを表示
set title
" 保管メニューの高さを10に制限
set pumheight=10

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅（0ならtabstopと同じ値で設定）
set shiftwidth=0

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" US配列用remap
" command W w
" command Q q
" command Wq wq
" command WQ wq

" sudo上書き保存
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>
" 保存時に行末スペース・タブを削除
autocmd BufWritePre * :%s/\s\+$//e

" 改行時の自動コメントアウトをオフ
" auto comment off
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

" ファイルを閉じるときにカーソル位置を記憶
if has("autocmd")
    augroup redhat
        " In text files, always limit the width of text to 78 characters
        autocmd BufRead *.txt set tw=78
        " When editing a file, always jump to the last cursor
        " position
        autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
    augroup END
endif
