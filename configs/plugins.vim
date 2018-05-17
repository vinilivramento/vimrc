"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Vundle setup for managing the plugins
" https://github.com/VundleVim/Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Asynchronous linting
Plugin 'w0rp/ale'

" Auto formatting
Plugin 'Chiel92/vim-autoformat'

" Asynchronous auto-complete
Plugin 'maralla/completor.vim'

" Fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'

" auto-completion for parenthesis, brackets, quotes, etc
Plugin 'Raimondi/delimitMate'

" IndentLine guides
Plugin 'Yggdroot/indentLine'

" several fancy color schemes
Plugin 'flazz/vim-colorschemes'

" comment multiple lines
Plugin 'scrooloose/nerdcommenter'

" visual plugin to show directory trees and navigate
Plugin 'scrooloose/nerdtree'

" Plugin to manage most recently used files
Plugin 'yegappan/mru'

" Alignment plugin
Plugin 'Tabular'

" fancy tagbar to be used with exuberant-ctags to navigate into functions
Plugin 'majutsushi/tagbar'

" Status line plugin
Plugin 'vim-airline/vim-airline'

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'


call vundle#end()


"""""""""""""""""" Configuring Plugins """"""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto format 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <C-a> :Autoformat<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE -  Asynchronous Syntatic checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Specify the active lintees
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'c': ['clang', 'gcc'],
\   'cpp': ['clang', 'gcc']
\}

"Enable the quicklist fix
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"Enable warning through vim-airline
let g:airline#extensions#ale#enabled = 1

"Easy navigation to previous and next errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

""""""""""""""""""""""""""""""
" => Completor plugin 
""""""""""""""""""""""""""""""
"let g:completor_python_binary = '/path/to/python/with/jedi/installed'
"let g:completor_clang_binary = '/usr/bin/clang++-3.8'

map <tab> <Plug>CompletorCppJumpToPlaceholder
imap <tab> <Plug>CompletorCppJumpToPlaceholder

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctrlp plugin shortcut for fuzzy finding
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

" when ctrlp is invoked without an explicit starting directory, it set the local directory
"let g:ctrlp_working_path_mode = 'ra'

" ignore files to speedup ctrlp
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
"let g:ctrlp_custom_ignore = 'some_bad_symbolic_links'
"let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$', 'link': 'some_bad_symbolic_links'}

" custom file listing command
"let g:ctrlp_user_command = 'find %s -type f'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
"if executable('ag')
"  " Use Ag over Grep
"  set grepprg=ag\ --nogroup\ --nocolor
"
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif

" avoid clearing cache when close vim
" let g:ctrlp_clear_cache_on_exit = 0

""""""""""""""""""""""""""""""
" => IndentLine plugin
""""""""""""""""""""""""""""""
"Set to green the indent line
let g:indentLine_color_term = 23
"Set the specific character for indent guide
let g:indentLine_char = '|'


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
let MRU_Max_Menu_Entries = 20

let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
let MRU_Exclude_Files = '^c:\\temp\\.*'           " For MS-Windows

map <C-m> :MRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tagbar config
"let g:tagbar_autofocus = 1
"let g:tagbar_compact = 1
"let g:tagbar_autoclose = 1
"let g:tagbar_ctags_bin = $CTAGS_PATH
"set tags=tags;

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabularize plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"if exists(":Tabularize")
  "nmap <Leader>a= :Tabularize /=<CR>
  "vmap <Leader>a= :Tabularize /=<CR>
  "nmap <Leader>a: :Tabularize /:\zs<CR>
  "vmap <Leader>a: :Tabularize /:\zs<CR>
"endif

"" Trigger automatic alignment for | character
"inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

"function! s:align()
  "let p = '^\s*|\s.*\s|\s*$'
  "if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    "let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    "let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    "Tabularize/|/l1
    "normal! 0
    "call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  "endif
"endfunction


