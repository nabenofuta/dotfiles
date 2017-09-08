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

"辞書呼出 入力中
inoremap <C-K> <C-x><C-k>
"行削除 入力中
inoremap <C-D> <ESC>ddi
" 通常モード 全削除
nnoremap <silent><C-Z> :%d<CR>


" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

" カーソル移動
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk

" encording変換
nnoremap <silent> ,E :set fileencoding=euc-jp <CR>
nnoremap <silent> ,S :set fileencoding=cp932 <CR>
nnoremap <silent> ,U :set fileencoding=utf-8 <CR>

" buffer 操作
nnoremap <silent> ,bb :b#<CR>
nnoremap <silent> ,bd :bd!<CR>
nnoremap <silent><C-B> :enew<CR>

" カーソルを常にディスプレイ中央にする
nnoremap <silent> ,21 :set scrolloff=9999<CR>
nnoremap <silent> ,22 :set scrolloff=0<CR>

