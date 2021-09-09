filetype plugin indent on		" auto-indenting depending on file type
set nocompatible				" disable compatibility with vi

if exists('+termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

set number						" line numbers
set backspace=indent,eol,start	" backspace always working in insert mode
set showcmd						" show current partial command
set noswapfile
set nobackup					" disable backup file creation
set nowritebackup
set encoding=utf-8
set autowrite					" automatically save before :next, :make, etc
set autoread					" automatically reread changed files
set laststatus=2
set hidden						" hide buffers instead of closing them

set splitright					" split vertical windows to the right
set splitbelow					" split horizontal windows below

set ruler						" always show the cursor position
au FocusLost * :wa				" save all buffers on focus out
set ttyfast

set mouse=v						" middle-click paste
set mouse=a						" enable mouse click

set hlsearch					" highlight search
set incsearch					" incremental search
set ignorecase					" search case insensitive...
set smartcase					" except when the it contains upper case characters
set conceallevel=0				" do not hide markdown

set nocursorcolumn
set nocursorline
set norelativenumber

set wrap
set textwidth=80
set formatoptions=qrn1

set tabstop=4
set softtabstop=4				" multiple spaces as tabstops
set smarttab
set shiftwidth=4
set autoindent
set smartindent
set showmatch

set nrformats-=octal
set shiftround

set notimeout                   " time out on key code but not on mappings
set ttimeout
set ttimeoutlen=10

set complete=.,w,b,u,t          " better completion
set completeopt=longest,menuone

set wildmenu
set wildmode=longest,list		" bash-like tab completion

" remap split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Disable arrow keys
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>

" Disable ctrl-b
noremap <C-B> <Nop>

let mapleader = ","

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

call plug#begin(expand('~/.vim/plugged'))
	Plug 'arcticicestudio/nord-vim'
    Plug 'vim-airline/vim-airline'
	Plug 'c3m3gyanesh/p4-syntax-highlighter-collection'
	Plug 'sheerun/vim-polyglot'
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'tpope/vim-vinegar'
	Plug 'dense-analysis/ale'
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	Plug 'ntpeters/vim-better-whitespace'
call plug#end()

colorscheme nord
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
set cursorline

syntax on

" ==================== netrw ====================

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4				" open netrw in a vertical split
let g:netrw_winsize = 20
let g:netrw_altv = 1
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :20Lexplore
" augroup END

nnoremap <leader>n :20Lexplore<CR>

" ==================== airline ====================

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" use powerline fonts when not in an ssh session
let g:remoteSession = ($STY == "")
if g:remoteSession
  let g:airline_powerline_fonts=1
endif

" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#whitespace#enabled=0

let g:airline_symbols.maxlinenr=''

" ==================== ale ====================

let g:ale_linters = {
\	'java': []
\ }

" ==================== fzf ====================

nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>

