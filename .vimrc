"added by juancho
set number
syntax on
set timeoutlen=1000
set ttimeoutlen=0
" colors
"let g:molokai_original = 1
set background=dark
colorscheme gruvbox
"colorscheme molokai 
set laststatus=2

" mappings
:map <C-n> :NERDTree
inoremap jj <Esc>

" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" plugins
call plug#begin()
	Plug 'itchyny/lightline.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/syntastic'
	Plug 'kien/ctrlp.vim'
	Plug 'ervandew/supertab'
call plug#end()
