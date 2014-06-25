set nu                          " Line numbers on
syntax on                   " Syntax highlighting
:colo molokai
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8
set encoding=utf-8

" show trailing whitespaces and tabs
set list
set listchars=trail:·,tab:»·

set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set showmode                    " Display the current mode
"set cursorline                  " highlight cursor line
autocmd WinEnter,BufReadPre * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

set scrolloff=999               " keep cursor centered in window
set foldmethod=indent
set nofoldenable
set t_Co=256

set wrap!
set wildmenu

set nobackup       "no backup files
"set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" Airline setup
let g:airline_theme='powerlineish'
if !exists('g:airline_symbols')
 let g:airline_symbols = {}
endif

set laststatus=2

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = ''
"let g:airline_left_sep = '▶'
"let g:airline_left_sep = ''
""let g:airline_right_sep = '«'
"let g:airline_right_sep = ''
""let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.branch = ''
"let g:airline_symbols.paste = 'ρ'
""let g:airline_symbols.paste = 'Þ'
""let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_symbols.whitespace = ' '
let g:airline_theme= 'badwolf'

let g:airline_powerline_fonts = 1

filetype plugin on             " Automatically detect file types."

set runtimepath^=~/.vim/bundle/ctrlp.vim

" :hi Directory guifg=#FF0000 ctermfg=red

let mapleader = ","
" select all
map <Leader>a ggVG
map <Leader>n :NERDTreeToggle<CR>
map <Leader>t :TagbarToggle<CR>
"map <C-Left> <Esc>:tabprev<CR>
"nnoremap ^[OD gT
"map <C-Right> <Esc>:tabnext<CR>
"nnoremap ^[[C gt
nnoremap <leader>s :set hlsearch!<CR>
nnoremap <leader>pb :CtrlPBuffer<cr>
nnoremap <leader>pm :CtrlPMRUFiles<cr>
nnoremap <leader>p :CtrlP<cr>
" let g:user_emmet_expandabbr_key = '<c-e>'
let g:user_emmet_leader_key='<C-e>'

"let g:neocomplete#enable_at_startup = 1

execute pathogen#infect()


" NEOCOMPLETE
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" NEOSNIPPET
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

set tags=tags

let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000

