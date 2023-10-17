" NeoVim config file

set nocompatible
filetype plugin indent on
syntax on

set expandtab
set shiftwidth=2
set tabstop=2
set smartindent
set relativenumber          " Number all lines relative to the current line.
set number                  " Give absolute line number for current line.
set cursorline              " Underline current line.
set encoding=utf-8          " Enable unicode.
set tw=80                   " Set the textwidth to 80.
set colorcolumn=80          " Display a red line at column 80.
set hidden                  " Allow hidden buffers.
set list listchars=trail:·  " Displays trailing whitespace as middle-dots

" Set the <leader> key to "," instead of the default "/" as it is easier to
" use.
let mapleader = ","

" Color scheme configuration.
colo default

"set termguicolors
set t_Co=256
set background=dark

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" For vim-airline config
let g:airline_theme='bubblegum'

" powerline symbols
let g:airline_symbols = {}

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:airline_symbols.crypt = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" Use ESC to exit editing mode in the terminal.
au TermOpen * tnoremap <Esc> <c-\><c-n>

" Specifies the vim-plug directory
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git support.
Plug 'tpope/vim-fugitive'

" LaTeX support. Note v2.14 is currently broken, so stay on v2.13.
Plug 'lervag/vimtex', { 'tag': 'v2.13' }

" Vimwiki support.
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/journal/', 'syntax': 'markdown',
                      \ 'ext': '.md', 'auto_tags': 1}]
let g:vimwiki_folding = 'syntax'
let g:vimwiki_autowriteall = 0    " Disable autowriting for VimWiki pages.
let g:vimwiki_key_mappings = { 'table_mappings': 0 } " Prevent VimWiki from
                                                     " stealing TAB bindings.

" Support for the Coq theorem prover.
Plug 'whonore/Coqtail'
let g:coc_disable_startup_warning = 1

" Syntatic language support.
Plug 'rust-lang/rust.vim'
Plug 'ledger/vim-ledger'
au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger

" Semantic language support.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Install global extensions that should be installed for coc.nvim.
let g:coc_global_extensions = [ 'coc-rust-analyzer', 'coc-clangd' ]

" Set noselect which improves autoselect highlighting.
let g:coc_user_config = {}
let g:coc_user_config['suggest.noselect'] = v:true
let g:coc_user_config['diagnostic.checkCurrentLine'] = v:true

" Initialize plugin system
call plug#end()

""" Start CoC Config

" Use <tab> to trigger completion and navigate to the next complete item.
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Use enter to confirm autocomplete.
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Show documentation for the symbol under the cursor.
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

""" End CoC Config
