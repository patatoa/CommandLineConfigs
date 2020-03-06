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
"Plugin 'valloric/youcompleteme'
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
Plugin 'Omnisharp/omnisharp-vim'
Plugin 'dense-analysis/ale'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'yami-beta/asyncomplete-omni.vim'
Plugin 'SirVer/ultisnips'
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
set shiftwidth=4
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
"Ctrl-s to start search and replace
nnoremap <C-s> :%s/

"Leader-c to open QuickFix panel, and Leader-x to close.
nnoremap <leader>c :cope<CR>
nnoremap <leader>x :cclose<CR>


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
"set the path for easier fuzzy finding.
set path=.,/usr/include,,**,

""""" Omnisharp boilerplate
 let g:OmniSharp_server_stdio = 1
 let g:OmniSharp_server_use_mono = 1
 let g:ale_linters = {
						 \ 'cs': ['OmniSharp']
						 \}
 let g:syntastic_cs_checkers = ['code_checker']
 set completeopt=longest,menuone,preview
 set previewheight=5
 augroup omnisharp_commands
	 autocmd!
		" Show type information automatically when the cursor stops moving.
		" Note that the type is echoed to the Vim command line, and will overwrite
		" any other messages in this space including e.g. ALE linting messages.
		 autocmd CursorHold *.cs OmniSharpTypeLookup
		 " The following commands are contextual, based on the cursor position.
		autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
		autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
		autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
		autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

		" Finds members in the current buffer
		autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

		autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
		autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
		autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
		autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
		autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

		" Navigate up and down by method/property/field
		autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
		autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

		" Find all code errors/warnings for the current solution and populate the quickfix window
		autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
let g:asyncomplete_auto_popup = 1
set completeopt+=preview
call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
						\ 'name': 'omni',
						\ 'whitelist': ['*'],
						\ 'blacklist': ['c', 'cpp', 'html'],
						\ 'completor': function('asyncomplete#sources#omni#completor')
						\  }))
let g:OmniSharp_want_snippet=1
