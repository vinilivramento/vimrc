"""""""""""""""""""""""""""""""""""""
" VIM Configuration File            "
" Author: Vinicius Livramento       "
" Email: vinilivramento@gmail.com   "
" Last Updated: 26/09/2019          "
"""""""""""""""""""""""""""""""""""""

" change leader to ,
let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Setup plugins using Plug manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" specify the directory for plugins
call plug#begin('~/.vim/plugged')

" Asynchronous linting
Plug 'dense-analysis/ale'

" Running commands in background 
Plug 'skywind3000/asyncrun.vim'

" Switch between source/header
Plug 'vim-scripts/a.vim'

" auto-completion for parenthesis, brackets, quotes, etc
Plug 'Raimondi/delimitMate'

" IndentLine guides
Plug 'Yggdroot/indentLine'

" several fancy color schemes
Plug 'flazz/vim-colorschemes'

" comment multiple lines
Plug 'scrooloose/nerdcommenter'

" visual plugin to show directory trees and navigate
Plug 'scrooloose/nerdtree'

" Plug to manage most recently used files
Plug 'yegappan/mru'

" fancy tagbar to be used with exuberant-ctags to navigate into functions
Plug 'majutsushi/tagbar'

" Status line plugin
Plug 'vim-airline/vim-airline'

" Extra themes for vim-airline 
Plug 'vim-airline/vim-airline-themes'

" fuzzy finder
Plug 'junegunn/fzf.vim'

" conquer of completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" better vim highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use vim settings, rather then vi settings 
set nocompatible

" Change shell
set shell=bash

" Enable filetype plugins
filetype on                 
filetype plugin on
filetype indent on

" automatically update when a file is changed outside
set autoread

" vimdiff option to ignore whitespace comparison
set diffopt+=iwhite
set diffexpr=""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enables mouse 'all'
set mouse=a         
" keep the cursor away from top/bottom
set scrolloff=4

" tab completion such as bash
set wildmenu
set wildmode=longest:full
" ignore files and directories
set wildignore+=*/tmp/*,*/.cache/*,*/.git/*,*.so,*~,*.pyc,*.bak,*.class,*.swp,*.zip,*.pdf 
set wildignore+=*\\tmp\\*,*.exe  " Windows

" Always show a status bar
set laststatus=2
" display line numbers
set number
" display incomplete commands
set showcmd
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
"Always show current position
set ruler
" Height of the command bar
set cmdheight=2
" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" No spaces between rows
set linespace=0

" Make the copied text through yank command available in the system clipboard
set clipboard=unnamedplus

" Since Vim will source .vimrc from any directory you run Vim from, this is
" a potential security hole; so, you should consider setting secure option.
" This option will restrict usage of some commands in non-default .vimrc files;
" commands that write to file or execute shell commands are not allowed and map 
" commands are displayed.
set secure


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable syntax highlighting
syntax enable

" enable 256 color pallete for the terminal
set t_Co=256

" dark color scheme
colorscheme gruvbox
set background=dark

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,mac,dos

""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""

" Turn backup off
set nobackup
set nowb
set noswapfile
set nowritebackup

" Sets how many lines of history VIM has to remember
set history=1000
" persistent undo
set undofile   
" maximum number of changes that can be undone
set undolevels=1000
 "maximum number lines to save for undo on a buffer reload
set undoreload=10000
" undo directory
set undodir=~/.vim/.undo,~tmp,/tmp
" backup directory
set backupdir=~/.vim/.backup//
" swap directory
set directory=~/.vim/.swp//

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Linebreak on 500 characters
set lbr
set textwidth=500

"Auto indent enables the use of indentention of previous line
set autoindent
"Smart indent allows the use of c indentation
set smartindent

"Wrap lines
set wrap
"disable preview scratch window
set completeopt=longest,menuone

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntatic and spell check
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Spell checking
set spelllang=en_us             " English as default language
set complete+=kspell            " Word completion
set nospell                     " Disable by default


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tags  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Searches for tags file in cur directory and up until HOME
set tags=./tags,tags;$HOME

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:function ReadClangCompleteFile()
:  try
:    return join(readfile('./.clang_complete'), " ")
:  catch /.*/
:    return ""
:  endtry
:endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin AsyncRun
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:asyncrun_open = 6

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin A.vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Auto format 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"disable the fallback to vim's indent file, retabbing and removing trailing whitespace, set the following variables to 0.
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin ALE -  Asynchronous Syntatic checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Specify the active lintees
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'c': ['cppcheck'],
\   'cpp': ['cppcheck']
\}

"Linter enabled only for those specified in g:ale_linters dictionary
let g:ale_linters_explicit = 1

"Enable the quicklist fix
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"Enable warning through vim-airline
let g:airline#extensions#ale#enabled = 1

""""""""""""""""""""""""""""""
" => Plugin IndentLine 
""""""""""""""""""""""""""""""
"Set to green the indent line
let g:indentLine_color_term = 23
"Set the specific character for indent guide
let g:indentLine_char = '|'

""""""""""""""""""""""""""""""
" => Plugin MRU 
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 100
let MRU_Max_Menu_Entries = 20

let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
let MRU_Exclude_Files = '^c:\\temp\\.*'           " For MS-Windows

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin NerdCommenter 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin VIM airline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme='bubblegum'
let g:airline_solarized_bg='dark'

set laststatus=2

let g:airline_powerline_fonts = 1                           " Use Powerline fonts to show beautiful symbols
let g:airline_inactive_collapse = 0                         " Do not collapse the status line while having multiple windows

let g:airline#extensions#whitespace#enabled = 0             " Do not check for whitespaces
let g:airline#extensions#capslock#enabled = 1               " Enable capslock check 
let g:airline#extensions#branch#enabled = 1                 " Enable Git client integration
let g:airline#extensions#tagbar#enabled = 1                 " Enable Tagbar integration
let g:airline#extensions#hunks#enabled = 1                  " Enable Git hunks integration

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Tagbar plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Vim cpp enhanced highlight 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highligh = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin coc.nvim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Disable PageUp/PageDown
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>

" disable entering in replace mode when pressing insert twice. You can still enter in replace mode using R
imap <Insert> <Nop>
inoremap <S-Insert> <Insert>

" maps from: pazams/d-is-for-delete
" The idea is to remap the delete commands to put them in the black hole register
" This avoids that delete copies the deleted line/block to the buffer
nnoremap x "_x
nnoremap X "_X
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

" faster moving
nnoremap <C-j> jjjj
nnoremap <C-k> kkkk 
nnoremap <C-h> hhhh 
nnoremap <C-l> llll 

" Hard mapping of upper case letters in normal mode
" to avoid problems when capslock is enable
nnoremap H h
nnoremap J j
nnoremap K k
nnoremap L l

" yank from cursor to the end of the line
nnoremap Y y$
" yank always yanks the whole word
nnoremap yw yiw

" Useful mappings for managing tabs
nnoremap <Tab> :tabnext<CR> 
nnoremap <S-Tab> :tabprevious<CR>

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Mappings for opening terminal
nnoremap <leader><leader>v :vertical terminal<CR>
nnoremap <leader><leader>s :terminal<CR>

" Open most-recently used files plugin
nnoremap <Leader>m :MRU<CR> 

" Format selected block
vnoremap <C-a> :Autoformat<CR>
" Format the whole file
nnoremap <C-@>a :<esc>ggVG:Autoformat<CR>

" Fuzzy file search
nnoremap <silent> <C-p> :Files<Cr>

" Fuzzy search of buffers 
nnoremap <silent> <F1> :Buffers <CR> 
" RegEx search for the word under cursor
nnoremap <silent> <F3> :Rg <C-R><C-W><CR> 
" Open source/header switch in a vertical tab 
nnoremap <silent> <F4> :AV<CR>
" open the file under the cursor in a vertical tab 
nnoremap <silent> <F5> :IHV<CR>
" Set local spell on/off
nnoremap <silent> <F7> :setlocal spell!<CR>
" Open nerdtree
nnoremap <silent> <F8> :NERDTreeToggle<CR>
" Open Tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>
" Async quickfix window
nnoremap <silent> <F10> :call asyncrun#quickfix_toggle(6)<cr>
" Async make
nnoremap <silent> <F12> :AsyncRun make<cr>

