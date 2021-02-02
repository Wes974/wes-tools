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
\ 'coc-actions',
\ 'coc-highlight',
\ 'coc-python',
\ 'coc-clangd',
\ 'coc-sh'
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

" Snippets
Plug 'honza/vim-snippets'

" Linting
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }

" Syntax
Plug 'sheerun/vim-polyglot'

" See parentheses easier
Plug 'junegunn/rainbow_parentheses.vim'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plist support
Plug 'darfink/vim-plist', { 'for': 'plist' }

" Whitespace
Plug 'ntpeters/vim-better-whitespace'

" Git integration
Plug 'airblade/vim-gitgutter'

" Better icons
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

"   General options ------------------------------------------------------------

" Always utf8
set ffs=unix
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8      " UTF-8 on write
filetype plugin indent on

set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc

set undodir=~/.config/nvim/undodir        " Disabled for now
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

if exists('+termguicolors')
    set termguicolors
endif
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

" set tabstop=4           " Numbers of visual spaces / tabs.
" set softtabstop=4       " Numbers of spaces / tabs.
" set expandtab           " Tab -> Space.
" set shiftwidth=4
" set shiftround

set expandtab           " Tab -> Space.
set shiftwidth=4        " When shifting, indent using four spaces.
set softtabstop=-1      " Use same value as shiftwidth.
set shiftround          " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set smarttab
set smartindent         " Makes indenting smart
set autoindent          " Good auto indent

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
set swb=usetab,split

" Floatting windows transparency
set winblend=10

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

" rainbow-parentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses

" clang-format
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1

"   Keys    --------------------------------------------------------------------

" Move by visual line
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'

" Map ; to :
nnoremap ; :

" Easier split navigations.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"   coc.nvim config     --------------------------------------------------------

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)