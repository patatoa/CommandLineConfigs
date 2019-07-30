set nocompatible              " be iMproved, required
filetype off                  " required

"""" Vundle Section Begin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'honza/vim-snippets'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'kblin/vim-fountain'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'posva/vim-vue'
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
"""" Vundlr Section End

set nowrap
set relativenumber
set number
set lazyredraw
set showmatch
set incsearch
set hlsearch
syntax on
set tabstop=4
set softtabstop=4
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za "Toggle fold with Space
set foldmethod=syntax
let mapleader="`"
"Easier navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright


""""" NERD Tree stuff
" Start nerd tree if you vim into a directory.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"Ctrl-n to open Nerd Tree
map <C-n> :NERDTreeToggle<CR>
"Close vim if only Nerd Tree remains open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"use arrows for NERD tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"F8 for Tagbar
nmap <F8> :TagbarToggle<CR>

"the below is for vim background color support in st.
if &term =~ '256color'
		    " disable Background Color Erase (BCE) so that color schemes
			" render properly when inside 256-color tmux and GNU screen.
			" see also http://sunaku.github.io/vim-256color-bce.html
   set t_ut=
 endif
