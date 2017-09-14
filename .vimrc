" PART1--------------------- 環境設定 set~
set encoding=utf-8
set fileencodings=euc-jp,utf-8,iso-2022-jp,cp932,sjis
set fileformats=unix,dos,mac
"  swap の保存場所
set directory=~/.vim/swap
"  backup の保存場所
set backupdir=~/.vim/tmp
"  保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
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
" 辞書設定
set dictionary=/home/watanabe/.vim/words/db.words
" 2バイト文字を正しく表示する
set ambiwidth=double
" ステータスバーの表示
set laststatus=2
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

" 括弧の対応を表示する
set showmatch
source $VIMRUNTIME/macros/matchit.vim
" 検索時にハイライト
set hlsearch
" コマンドの補完を表示
set wildmenu

" PART1 END---------- 

" PART2------------ キーバインド設定~
" 選択部分をクリップボードにコピー
vmap <C-C> "*y
" Ctrl+Qで貼り付け
nnoremap <C-Q> "*pa<ESC>
" 挿入モード時、クリップボードから貼り付け
inoremap <C-Q> <ESC>"*pa
" 選択部分をクリップボードの値に置き換え
vmap <C-Q> d"*P
" コマンドライン時、クリップボードから貼り付け
cmap <C-Q> <C-R>*
" 通常モード 全削除
nnoremap <silent><C-Z> :%d<CR>
"tab操作
nnoremap <silent> ,tt :tabnew<CR>
nnoremap <silent> ,tn :tabn<CR>
nnoremap <silent> ,tp :tabp<CR>
nnoremap <silent> ,tc :tabc<CR>
nnoremap <silent> ,to :tabo<CR>
nnoremap <silent> ,tr :tabr<CR>
nnoremap <silent> ,tl :tabl<CR>
" buffer 操作
nnoremap <silent> ,bb :b#<CR>
nnoremap <silent> ,bd :bd!<CR>
nnoremap <silent><C-B> :enew<CR>
" カーソルを常にディスプレイ中央にする
nnoremap <silent> ,21 :set scrolloff=9999<CR>
nnoremap <silent> ,22 :set scrolloff=0<CR>
" カーソル移動
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk
" 挿入モード時 カーソルの移動
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-G><C-J> <Down>
inoremap <C-G><C-K> <Up>
"挿入モード時 カーソルより後ろを削除
inoremap <C-K> <ESC>ld$A
"辞書
inoremap <C-M> <C-X><C-K>

" ペースト
" encording変換
nnoremap <silent> ,E :set fileencoding=euc-jp <CR>
nnoremap <silent> ,S :set fileencoding=cp932 <CR>
nnoremap <silent> ,U :set fileencoding=utf-8 <CR>

" PART2 END---------- 

" PART3------------ NoBundle Plugin関連~
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
" 直近開いたファイルを開く
NeoBundle 'Shougo/neomru.vim'

" vim-shell
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'

" コメントアウトを補助する
NeoBundle 'tyru/caw.vim.git'
" HTML 補完
NeoBundle 'mattn/emmet-vim'
" css 補完
NeoBundle 'hail2u/vim-css3-syntax'
" css カラー
NeoBundle 'gko/vim-coloresque'
" シンタックス
NeoBundle 'vim-syntastic/syntastic'
" インデント表示
NeoBundle 'Yggdroot/indentLine'
"Ctag 利用
" プロジェクトのルートディレクトリで1度だけ
" :TagsGenerate を手動実行する
NeoBundle 'szw/vim-tags'
let g:vim_tags_project_tags_command = "/usr/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"
"tagbar
NeoBundle 'majutsushi/tagbar.git'

"File Tree表示
NeoBundle 'scrooloose/nerdtree'
" Unite.vim 
NeoBundle 'Shougo/unite.vim'
" Outline
NeoBundle 'Shougo/unite-outline'
" 括弧の入力補助
NeoBundle 'cohama/lexima.vim'

"--- Color Scheme ---
syntax on
colorscheme molokai
set t_Co=256
"--- NERDTree config ---
nnoremap <silent><C-F> :NERDTreeToggle<CR>
" 隠しファイルをデフォルトで表示させる
"let NERDTreeShowHidden = 1

"--- markdown preview config ---
nnoremap <silent><C-M> :PrevimOpen<CR>
"--- vimshell config ---
nnoremap <silent> ,zz :VimShell <CR>

"---- tagbar config ---
let g:tagbar_left = 0
let g:tagbar_autofocus = 1
nnoremap <silent> ,tg :TagbarToggle<CR>

"--- syntax config ---
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"perl check
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']
"php check
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1

"--- Unit.vim config ---
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧 -direction=botright -auto-resize -toggle
noremap <C-P> :Unite buffer  -direction=botright -auto-resize <CR>
nnoremap <silent> ,uy :<C-u>Unite history/yank -direction=botright -auto-resize <CR>
nnoremap <silent> ,ub :<C-u>Unite buffer -direction=botright -auto-resize <CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file -direction=botright -auto-resize <CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register -direction=botright -auto-resize <CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru  -direction=botright -auto-resize <CR>
nnoremap <silent> ,uo :<C-u>Unite outline -direction=botright -auto-resize <CR>

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer -direction=botright -auto-resize <CR>

"カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer -direction=botright -auto-resize <CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer -direction=botright -auto-resize <CR>
" unite grepにhw(highway)を使う
if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
endif

" --- markdown 関連 config ---
" .md のファイルをmarkdownのファイルタイプとして認識する
au BufRead,BufNewFile *.md set filetype=markdown

" PART3-2 ----- PHP 向けIDE
" http://kaworu.jpn.org/vim/vim%E3%81%AEPHP%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83

" neocomplete ---------------start
NeoBundle 'Shougo/neocomplete.vim'


"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" neocomplete -------------- end

" phpの説明表示 neocomplete-php.vim--------------- start 
NeoBundle 'violetyk/neocomplete-php.vim'
let g:neocomplete_php_locale = 'ja'
" 一度だけ、以下を実行する
" :PhpMakeDict ja
" phpの説明表示 neocomplete-php.vim--------------- end

" snipet -------------------- start  
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

filetype plugin indent on
" snipet -------------------- end

" PART3 END---------- 
call neobundle#end()

" Required:
filetype plugin on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" 環境ごとの切り分けこれで、Win用とLinux用途共用にできるのか?
" if has("mac")
" 	let g:tagbar_ctags_bin = '/hogehoge/ctags'
" endif
" if has("win32")
" 	let g:tagbar_ctags_bin = 'C:\hogehoge\ctags.exe'
" endif


