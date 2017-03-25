" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'hdima/python-syntax'
Plug 'itchyny/lightline.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Shougo/neocomplete.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
Plug 'jiangmiao/auto-pairs'
" Initialize plugin system
call plug#end()

" Basic configs
set nocompatible
filetype plugin indent on
syntax enable
set encoding=utf-8
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
retab
set textwidth=79
set autoindent
set smartindent
set fileformat=unix
set backspace=indent,eol,start

" Do not keep a backup file, use versions instead
if has("vms")
    set nobackup
else
    set backup
endif
set history=50
set showcmd
set incsearch

" Enableing mouse
if has('mouse')
    set mouse=a
endif

" Airline configs
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled = 1

" Syntastic configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']

" GitGutter configs
let g:gitgutter_max_signs = 500

" Syntax configs
set background=dark
colorscheme PaperColor
set number
set laststatus=2
let python_highlight_all = 1

" Neocomplete configs
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

" YCM configs
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_auto_trigger = 1
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_filetype_specific_completion_to_disable = {'gitcommit': 1}
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_always_populate_location_list = 0
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_allow_changing_updatetime = 1
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_seed_identifiers_with_syntax = 0

" Jedi configs
let g:jedi#popup_on_dot = 0
autocmd FileType python setlocal completeopt-=preview

" GVIM configs
set guifont=Monaco\ 12
if has('gui_running')
    set lines=999 columns=999
endif

" Shortcut
noremap <silent> <F5> :!clear;python3 %<CR>
noremap <silent> <F5> :!clear;autopep8 --in-place --aggressive --aggressive %<CR>
