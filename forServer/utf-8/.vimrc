set encoding=utf-8
set fileencodings=euc-jp,utf-8,iso-2022-jp,cp932,sjis
set fileformats=unix,dos,mac

" ��¸����Ƥ��ʤ��ե����뤬����Ȥ��Ǥ��̤Υե�����򳫤���褦�ˤ���
set hidden

" ���֤�ɽ������Ȥ�����
set tabstop=4
" ���֤���������Ȥ�����
set shiftwidth=4
" ���֤򥿥֤Ȥ��ư���(���ڡ�����Ÿ�����ʤ�)
set noexpandtab
" 
set softtabstop=0

set dictionary=/home/watanabe/.vim/words/db.words
" set showtabline=2
set ambiwidth=double
" show status
set laststatus=2
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

"����ƽ� ������
inoremap <C-K> <C-x><C-k>
"�Ժ�� ������
inoremap <C-D> <ESC>ddi
" �̾�⡼�� �����
nnoremap <silent><C-Z> :%d<CR>


" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

" ���������ư
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk

" encording�Ѵ�
nnoremap <silent> ,E :set fileencoding=euc-jp <CR>
nnoremap <silent> ,S :set fileencoding=cp932 <CR>
nnoremap <silent> ,U :set fileencoding=utf-8 <CR>

" buffer ���
nnoremap <silent> ,bb :b#<CR>
nnoremap <silent> ,bd :bd!<CR>
nnoremap <silent><C-B> :enew<CR>

" ����������˥ǥ����ץ쥤����ˤ���
nnoremap <silent> ,21 :set scrolloff=9999<CR>
nnoremap <silent> ,22 :set scrolloff=0<CR>

