"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin setup and respective key mappings
" => Vim-Vundle setup for managing the plugins
" https://github.com/VundleVim/Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Required by Vundle
filetype off 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Asynchronous linting
Plugin 'w0rp/ale'

" Switch between source/header
Plugin 'vim-scripts/a.vim'

" Auto formatting
Plugin 'Chiel92/vim-autoformat'

" Fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'

" auto-completion for parenthesis, brackets, quotes, etc
Plugin 'Raimondi/delimitMate'

" Generate doxygen comments
Plugin 'vim-scripts/DoxygenToolkit.vim'

" IndentLine guides
Plugin 'Yggdroot/indentLine'

" several fancy color schemes
Plugin 'flazz/vim-colorschemes'

" better and easier grepping inside vim
Plugin 'dkprice/vim-easygrep'

" comment multiple lines
Plugin 'scrooloose/nerdcommenter'

" visual plugin to show directory trees and navigate
Plugin 'scrooloose/nerdtree'

" Plugin to manage most recently used files
Plugin 'yegappan/mru'

" fancy tagbar to be used with exuberant-ctags to navigate into functions
Plugin 'majutsushi/tagbar'

" Status line plugin
Plugin 'vim-airline/vim-airline'

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()

"""""""""""""""""" Configuring Plugins """"""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => A.vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F4 - open source/header switch in a vertical tab 
map <F4> :AV<CR>
" F5 - open the file under the cursor in a vertical tab 
map <F5> :IHV<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto format 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When using clang-format and a .clang-format config file, 
" an interactive guide can be found in https://clangformat.com/
" and https://clang.llvm.org/docs/ClangFormatStyleOptions.html

" Format selected block
vnoremap <C-a> :Autoformat<CR>

" Format the whole file
map <C-@>a :<esc>ggVG:Autoformat<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE -  Asynchronous Syntatic checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Specify the active lintees
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'c': ['clang'],
\   'cpp': ['clang']
\}

"Linter enabled only for those specified in g:ale_linters dictionary
let g:ale_linters_explicit = 1

"Enable the quicklist fix
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"Enable warning through vim-airline
let g:airline#extensions#ale#enabled = 1

let g:ale_completion_enabled = 1
let g:ale_completion_max_suggestions = 10

let g:ale_cpp_clang_options = "-std=c++14 -Wall -Werror" 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctags Bar 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open Tagbar
nmap <F9> :TagbarToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctrlp plugin shortcut for fuzzy finding
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" when ctrlp is invoked without an explicit starting directory, it set the local directory
let g:ctrlp_working_path_mode = 'ra'

" CtrlP picks up configuration from wildignore 
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

" avoid clearing cache when close vim
let g:ctrlp_use_caching = 0

" ctrlp search in tags file
nnoremap <C-@>p :CtrlPTag<CR>

""""""""""""""""""""""""""""""
" => Dox 
""""""""""""""""""""""""""""""
" Create doxygen comment
map <F6> :Dox<CR>


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
let MRU_Max_Entries = 100
let MRU_Max_Menu_Entries = 20

let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
let MRU_Exclude_Files = '^c:\\temp\\.*'           " For MS-Windows

nnoremap <Leader>m :MRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open nerdtree
nnoremap <silent> <F8> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1


