""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                       My neovim config file.                                 "
"                                                                              "
"                       Author : Ouwéis Moolna                                 "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-lists',
\ 'coc-highlight',
\ 'coc-python',
\ 'coc-clangd'
\ ]

"   vim-plug    ----------------------------------------------------------------

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax
Plug 'sheerun/vim-polyglot'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plist support
Plug 'darfink/vim-plist', { 'for': 'plist' }

" FZF
Plug '/usr/local/opt/fzf'

" Initialize plugin system
call plug#end()

"   General options ------------------------------------------------------------

" Always utf8
set ffs=unix
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8      " UTF-8 on write
filetype plugin indent on

if has("vms")
    set nobackup	        " do not keep a backup file, use versions instead
else
    set backup		        " keep a backup file
endif

" set undodir=~/.config/nvim/undodir        " Disabled for now
set undofile
set undolevels=100
set undoreload=1000

" set backupdir=~/.config/nvim/backup       " Disabled for now
set mouse=a
set wildmenu                " Show all autocomplete of vim commands
set number                  " Show line numbers
set relativenumber          " Show relative numbers
set noshowmode
set lazyredraw
set clipboard=unnamedplus   " Access macOS clipboard
set wrap                    " Enable word wrap
set linebreak               " Wrap lines at convenient points
set hidden                  " Hide buffers in background
set autoread                " Reload a file when changed from the outside

set title
" set the title
set titlestring=%{substitute(getcwd(),\ $HOME,\ '~',\ '')}/
set titlestring+=%f

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Set Python paths (faster startup)
" let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Set Ruby path
" let g:ruby_host_prog = '/usr/local/lib/ruby/gems/2.7.0/bin/neovim-ruby-host'

"   Color Scheme Options    ----------------------------------------------------

set termguicolors
colorscheme civic

"   Auto commands   ------------------------------------------------------------

" detect .md as markdown instead of modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" stop highlighting of underscores in markdown files
autocmd BufNewFile,BufRead,BufEnter *.md,*.markdown :syntax match markdownIgnore "_"
" Restore last position
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
\ |   exe "normal! g`\""
\ | endif


"   Searching   ----------------------------------------------------------------

set ignorecase	" ignore case when searching…
set smartcase	" except when using uper-case letters.
set incsearch	" search as typing.
set hlsearch    " highlight search
" Remove search highlighting with delete/backspace key
nnoremap <silent> <BS> :nohlsearch<CR>

"   Tabs, Spaces, Scrolling and Splits  ----------------------------------------

set tabstop=4           " Numbers of visual spaces / tabs.
set softtabstop=4       " Numbers of spaces / tabs.
set expandtab           " Tab -> Space.
set shiftwidth=4
set shiftround

set scrolloff=15
set sidescrolloff=20
set sidescroll=1

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" More natural split opening
set splitbelow
set splitright

"   Plugins --------------------------------------------------------------------

" airline
let g:airline#extensions#tabline#enabled = 1                                    " Enable tabline extension
let g:airline#extensions#tabline#show_tabs = 0                                  " Always show
let g:airline#extensions#whitespace#enabled = 0                                 " Disable whitespace extension
let g:airline_theme = 'base16_google'                                           " Use base16 google theme

" NERDTree
" Launch NERDTree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close NERDTree if it's the only remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"   Keys    --------------------------------------------------------------------

" Move by visual line
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'

" vim-coc specific keybindings
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
