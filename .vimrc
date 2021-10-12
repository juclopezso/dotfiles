"
" minimal vimrc with no (extra) plugins
"

"load system defaults
if filereadable(expand('$VIMRUNTIME/defaults.vim'))
	unlet! g:skip_defaults_vim
	source $VIMRUNTIME/defaults.vim
endif

"regular settings
"----------------
" set leader key
let mapleader=" "
nnoremap <SPACE> <Nop>
" ui
set ruler
set wildmenu
set showcmd
set showmatch

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" encoding/format
set encoding=utf-8
set fileformats=unix,dos,mac

" searching
set nohlsearch
" set hlsearch
set incsearch
set ignorecase
set smartcase

" indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

" key timeout values
set esckeys
set ttimeoutlen=20
set timeoutlen=1000

" allow syntax and filetype plugins
syntax enable
filetype plugin indent on
runtime macros/matchit.vim

" autocmds
"---------
augroup general
    autocmd!
    "keep equal proportions when windows resized
    autocmd VimResized * wincmd =
    "save cursor position in a file
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"")
                \ <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup languages
    autocmd!
    autocmd BufNewFile,BufRead *.bash set syntax=sh
    autocmd FileType python xnoremap <leader>r <esc>:'<,'>:w !python3<CR>
    autocmd FileType go set noexpandtab
    autocmd FileType html :syntax sync fromstart
    autocmd FileType html,javascript,css,json,yaml,sh
                \ setlocal ts=2 sts=2 sw=2 expandtab
augroup END


" mappings
"----------
" remap esc key
:imap jj <Esc>
" override Y yank  
nnoremap Y y$
" keep the cursor in the middle of the screen
nnoremap n nzzzv
nnoremap N Nzzzv
" TODO: learn vim marks
" nnoremap J mzJ`z
" undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u
inoremap : :<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" jumlist mutations (more than 5 lines)
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
" super smart moving lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" inoremap <C-j> <esc>:m .+1<CR>==
" inoremap <C-k> <esc>:m .-2<CR>==
" nnoremap <leader>j :m .+1<CR>==
" nnoremap <leader>k :m .-2<CR>==
