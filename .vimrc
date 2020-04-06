"added by juancho
"
"COMMENTS
"To exit out of completion mode with what you originally 
"typed and stay in insert mode is <C-e>
set number
set relativenumber
set showcmd
set encoding=utf-8

" force it to use an older regular expression engine that handles ruby syntax better
set re=1
" enter the current millenium
set nocompatible
" enable syntax and plugins
filetype plugin on
syntax on
let mapleader = "\<Space>"

" registers
set clipboard=unnamed
set clipboard=unnamedplus

" TABS
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
" go between laast tabs
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap <Leader>0 :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" indents
set autoindent
filetype indent on
set smartindent

" colors
set background=dark
colorscheme gruvbox
autocmd BufEnter *.vue colorscheme minimalist

" MAPPINGS
inoremap kj <Esc>
cnoremap kj <C-C>
map <C-a> <esc>ggVG<CR>
map <C-p> :find 
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" FINDING FILES
set path+=** " search files into subfolder
set wildignore+=**/node_modules/** " ignore node_modules everywhere
set wildmenu " display matching files when tab to complete

" TAGS
" creates tags file, need to install ctags
command! MakeTags !ctags -R .
" Use Ctrl-] to jump to tag under cursor
" Use g-Ctrl-] for ambiguous tags
" Use Ctrl-t to jump back up the tag stack

" PLUGINS
 
call plug#begin()
    " Plug 'posva/vim-vue'
    Plug 'leafoftree/vim-vue-plugin'
    Plug 'jiangmiao/auto-pairs'
 	Plug 'vim-airline/vim-airline'
 	Plug 'scrooloose/nerdtree'
    Plug 'valloric/youcompleteme'
 	Plug 'scrooloose/syntastic'
	Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'majutsushi/tagbar'
    Plug 'joshdick/onedark.vim'
call plug#end()
" Tagbar
nmap <F8> :TagbarToggle<CR>

" NERDTree
map <C-n> :NERDTree<CR>
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" Synstastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim vue
let g:vim_vue_plugin_load_full_syntax = 1


" SNIPPETS
autocmd FileType html,js,vue nnoremap ,info :-1read $HOME/.vim/.js_info.js<CR>f'a
autocmd FileType html,erb,vue nnoremap ,h1 i<h1></h1><Esc>F>a
autocmd FileType html,erb,vue nnoremap ,h2 i<h2></h2><Esc>F>a
autocmd FileType html,erb,vue nnoremap ,p i<p></p><Esc>F>a
autocmd FileType html,erb,vue nnoremap ,b i<b></b><Esc>F>a

