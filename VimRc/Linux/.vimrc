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
Plugin 'neoclide/coc.nvim'
Plugin 'omnisharp/omnisharp-vim'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'Shougo/deoplete.nvim'
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
 "
"set the path for easier fuzzy finding.
set path=.,/usr/include,,**,

"Ctrl-s to start search and replace
nnoremap <C-s> :%s/

"Leader-c to open QuickFix panel, and Leader-x to close.
nnoremap <leader>c :cope<CR>
nnoremap <leader>x :cclose<CR>

"let g:OmniSharp_translate_cygwin_wsl = 1
let g:syntastic_cs_checkers = ['code_checker']
let g:OmniSharp_proc_debug = 1
"let g:OmniSharp_server_path = '/home/patrick/omnisharp2/omnisharp-roslyn/pkg/omnisharp-roslyn/opt/omnisharp-roslyn/OmniSharp.exe'
"let g:OmniSharp_server_path = '/mnt/c/omnisharp-win/omnisharp-win-x64/OmniSharp.exe'
"let g:OmniSharp_server_stdio = 1

"let g:UltiSnipsExpandTrigger="<tab>" 
"let g:UltiSnipsJumpForwardTrigger="<c-n>" 
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"  
"" If you want :UltiSnipsEdit to split your window. 
"let g:UltiSnipsEditSplit="vertical"
"set hidden


let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5


" Update semantic highlighting after all text changes
let g:OmniSharp_highlight_types = 3
" Update semantic highlighting on BufEnter and InsertLeave
" let g:OmniSharp_highlight_types = 2

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

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

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
 let g:OmniSharp_want_snippet=1
"
"set completeopt=longest,menuone
"inoremap <expr><TAB> pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr><Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"
