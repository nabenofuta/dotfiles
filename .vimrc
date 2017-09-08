set encoding=utf-8
set fileencodings=euc-jp,utf-8,iso-2022-jp,cp932,sjis
set fileformats=unix,dos,mac
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden

" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4
" タブをタブとして扱う(スペースに展開しない)
set noexpandtab
" 
set softtabstop=0

set dictionary=/home/watanabe/.vim/words/db.words
" set showtabline=2
set ambiwidth=double
" show status
set laststatus=2
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
" set buftype=nofile
" set guioptions-=m

" 選択部分をクリップボードにコピー
vmap <C-C> "*y
" Ctrl+Qで貼り付け
nmap <C-Q> "*pa<ESC>
" 挿入モード時、クリップボードから貼り付け
imap <C-Q> <ESC>"*pa
" 選択部分をクリップボードの値に置き換え
vmap <C-Q> d"*P
" コマンドライン時、クリップボードから貼り付け
cmap <C-Q> <C-R>*


"辞書呼出 入力中
inoremap <C-K> <C-x><C-k>
"行削除 入力中
inoremap <C-D> <ESC>ddi
" 通常モード 全削除
nnoremap <silent><C-Z> :%d<CR>


" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

function! ImInActivate()
	call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>


" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" markdown preview
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

au BufRead,BufNewFile *.md set filetype=markdown


" 直近開いたファイルを開く
NeoBundle 'Shougo/neomru.vim'
"
" vim-shell
NeoBundle 'Shougo/vimproc.vim'
" NeoBundle 'Shougo/vimshell.vim'

" commentout
NeoBundle 'tyru/caw.vim.git'

"File Tree表示
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'Shougo/unite.vim'
" Unit.vim config
" 入力モードで開始する
let g:unite_enable_start_insert=1

" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" NERDTree 
nnoremap <silent><C-F> :NERDTreeToggle<CR>

"画面サイズ変更
nnoremap <silent> ,11 :set columns=150 <CR>

" カーソル移動
nnoremap <silent> j gj
nnoremap <silent> k gk


" ペースト
" encording変換
nnoremap <silent> ,E :set fileencoding=euc-jp <CR>
nnoremap <silent> ,S :set fileencoding=cp932 <CR>
nnoremap <silent> ,U :set fileencoding=utf-8 <CR>

nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru <CR>
"tab操作
nnoremap <silent> ,tt :tabnew <CR>
nnoremap <silent> ,tn :tabn <CR>
nnoremap <silent> ,tp :tabp <CR>
nnoremap <silent> ,tc :tabc <CR>
nnoremap <silent> ,to :tabo <CR>
nnoremap <silent> ,tr :tabr <CR>
nnoremap <silent> ,tl :tabl <CR>
"vimshell
" nnoremap <silent> ,zz :VimShell <CR>
" buffer 操作
nnoremap <silent> ,bb :b#<CR>
nnoremap <silent> ,bd :bd!<CR>
nnoremap <silent><C-B> :enew<CR>

call neobundle#end()

" Required:
filetype plugin on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
