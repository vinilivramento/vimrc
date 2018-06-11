"""""""""""""""""""""""""""""""""""""
" VIM Configuration File            "
" Author: Vinicius Livramento       "
" Email: vinilivramento@gmail.com   "
" Last Updated: 06/04/2018          "
"""""""""""""""""""""""""""""""""""""

" change leader to ,
let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Configure plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/configs/plugins.vim

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
" commands that write to file or execute shell commands are not allowed and map commands are displayed.
set secure


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable syntax highlighting
syntax enable

" enable 256 color pallete for the terminal
set t_Co=256

" dark color scheme
"colorscheme Monokai
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
set nobackup
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
set completeopt=menu,menuone

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
" => Handling large files 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/configs/large_files.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/configs/key_mappings.vim

