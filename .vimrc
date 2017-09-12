set encoding=utf-8
set fileencodings=euc-jp,utf-8,iso-2022-jp,cp932,sjis
set fileformats=unix,dos,mac
"  保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden


" 環境ごとの切り分けこれで、Win用とLinux用途共用にできるのか?
" if has("mac")
" 	let g:tagbar_ctags_bin = '/hogehoge/ctags'
" endif
" if has("win32")
" 	let g:tagbar_ctags_bin = 'C:\hogehoge\ctags.exe'
" endif


" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4
" タブをタブとして扱う(スペースに展開しない)
set noexpandtab
" 
set softtabstop=0
set number

" オートインデント
set autoindent
set smartindent
 
" TerminalでのInsertMode強調
" カーソル行を強調表示しない
set nocursorline
" 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!

set dictionary=/home/watanabe/.vim/words/db.words
" set showtabline=2
set ambiwidth=double
" show status
set laststatus=2
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

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
" NeoBundle 'plasticboy/vim-markdown'
" リストのインデントなどの補完が便利なので、下記に変更した
NeoBundle 'violetyk/iikanji-markdown.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

au BufRead,BufNewFile *.md set filetype=markdown


" 直近開いたファイルを開く
NeoBundle 'Shougo/neomru.vim'
"
" vim-shell
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'

" commentout
NeoBundle 'tyru/caw.vim.git'

" " outLine
" NeoBundle 'majutsushi/tagbar'
" " OutLine の表示非表示
" nmap <F8> :TagbarToggle<CR>

" NeoBundle 'jszakmeister/markdown2ctags'
" " Add support for markdown files in tagbar.
" let g:tagbar_type_markdown = {
"     \ 'ctagstype': 'markdown',
"     \ 'ctagsbin' : '/path/to/markdown2ctags.py',
"     \ 'ctagsargs' : '-f - --sort=yes',
"     \ 'kinds' : [
"         \ 's:sections',
"         \ 'i:images'
"     \ ],
"     \ 'sro' : '|',
"     \ 'kind2scope' : {
"         \ 's' : 'section',
"     \ },
"     \ 'sort': 0,
" \ }


"File Tree表示
NeoBundle 'scrooloose/nerdtree'
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1

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
<<<<<<< HEAD
" markdown preview
nnoremap <silent><C-M> :PrevimOpen<CR>
" ���������ư
=======

" カーソル移動
>>>>>>> 502f86a8ea5c8f6cfd3987a2035d4b45f63e93d2
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk

" 挿入モード時 カーソルの移動
imap <C-F> <Right>
imap <C-B> <Left>

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
nnoremap <silent> ,tt :tabnew<CR>
nnoremap <silent> ,tn :tabn<CR>
nnoremap <silent> ,tp :tabp<CR>
nnoremap <silent> ,tc :tabc<CR>
nnoremap <silent> ,to :tabo<CR>
nnoremap <silent> ,tr :tabr<CR>
nnoremap <silent> ,tl :tabl<CR>
"vimshell
" nnoremap <silent> ,zz :VimShell <CR>
" buffer 操作
nnoremap <silent> ,bb :b#<CR>
nnoremap <silent> ,bd :bd!<CR>
nnoremap <silent><C-B> :enew<CR>
" カーソルを常にディスプレイ中央にする
nnoremap <silent> ,21 :set scrolloff=9999<CR>
nnoremap <silent> ,22 :set scrolloff=0<CR>

call neobundle#end()

" Required:
filetype plugin on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

