"added by juancho
set number
set relativenumber
syntax on
set timeoutlen=1000
set ttimeoutlen=0
filetype plugin on
set list

" colors
let g:molokai_original = 1
set background=dark
syntax enable
"colorscheme solarized
"let g:solarized_termcolors=256
colorscheme gruvbox
autocmd BufEnter *.vue colorscheme monokai 
"colorscheme molokai 
"colorscheme monokai 

set laststatus=2

" mappings
:map <C-n> :NERDTree
inoremap kj <Esc>
cnoremap kj <C-C>
" CtrlP mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['^node_modules$']
" plugins
call plug#begin()
	Plug 'itchyny/lightline.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/syntastic'
	Plug 'kien/ctrlp.vim'
	Plug 'ervandew/supertab'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'leafgarland/typescript-vim'
	Plug 'posva/vim-vue'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'
call plug#end()

"Plugin vue
"let g:vue_pre_processors = ['pug', 'scss']
"Plugin crtlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" sync open file with NERDTree
" " " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
"
" Call NERDTreeFind iff NERDTree is active, current window contains a
"   modifiable
"   " file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
