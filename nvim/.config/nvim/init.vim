" NeoVim config file

set expandtab
set shiftwidth=2
set tabstop=2
set smartindent
set relativenumber
set number

" Displays trailing whitespace as middle-dots
set list listchars=trail:·

set encoding=utf-8

set colorcolumn=80

"colo murphy
colo ron
syntax on

"set termguicolors
set t_Co=256
set background=dark

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" For vim-airline config
let g:airline_theme='bubblegum'
"'base16_bright'
"'base16_default
"base16_eighties
"base16_mocha
"base16_ocean
"base16_twilight
"distinguished
"sierra
"angr

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


" Specifies the vim-plug directory
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

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
let g:coc_global_extensions = [ 'coc-rust-analyzer' ]

" Initialize plugin system
call plug#end()

" use <tab> to trigger completion and navigate to the next complete item
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

let g:coc_user_config = {}
let g:coc_user_config['suggest.noselect'] = v:true

" Set the <leader> key to "," instead of the default "/" as it is easier to
" use.
let mapleader = ","

set cursorline
