"""""""""""""""""""""""""""""""""""""
" VIM Configuration File            "
" Author: Vinicius Livramento       "
" Email: vinilivramento@gmail.com   "
" Last Updated: 08/08/2017          "
"""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Vundle setup for managing the plugins
" https://github.com/VundleVim/Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" several fancy color schemes
Plugin 'flazz/vim-colorschemes'

" comment multiple lines
Plugin 'scrooloose/nerdcommenter'

" auto-completion for parenthesis, brackets, quotes, etc
Plugin 'Raimondi/delimitMate'

" fancy tagbar to be used with exuberant-ctags to navigate into functions
Plugin 'majutsushi/tagbar'

" visual plugin to show directory trees and navigate
Plugin 'scrooloose/nerdtree'

" Fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'

" IndentLine guides
Plugin 'Yggdroot/indentLine'

" Alignment plugin
Plugin 'Tabular'

" Auto-complete and syntatic check
Plugin 'Valloric/YouCompleteMe'

"" Syntatic check
"Plugin 'vim-syntastic/syntastic'

call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" required by vundle
filetype off                 

" use Vim settings, rather then Vi settings (much better!).
set nocompatible

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
set wildmode=longest,list

" Always show a status bar
set laststatus=2
" display line numbers
set number
" display incomplete commands
set showcmd
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" Turn on the WiLd menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
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

" set color to highlight search
"set hi Search guibg='Blue' guifg='NONE'

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

" case insensitive search
set ignorecase

" Make the copied text through yank command available in the system clipboard
set clipboard=unnamedplus


"hi Pmenu guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
"hi PmenuSbar guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
"hi PmenuThumb guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE


" Fancy status line with more information
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Column number
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.


" ctrlp plugin shortcut for fuzzy finding
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" when ctrlp is invoked without an explicit starting directory, it set the local directory
let g:ctrlp_working_path_mode = 'ra'

" ignore files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" ignore files to speedup ctrlp
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_custom_ignore = 'some_bad_symbolic_links'
"let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$', 'link': 'some_bad_symbolic_links'}

" custom file listing command
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux"

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" avoid clearing cache when close vim
" let g:ctrlp_clear_cache_on_exit = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable syntax highlighting
syntax enable

" enable 256 color pallete for the terminal
set t_Co=256

" dark color scheme
colorscheme Monokai
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

" persistent undo
set undofile   
" maximum number of changes that can be undone
set undolevels=1000
 "maximum number lines to save for undo on a buffer reload
set undoreload=10000
" undo directory
set undodir=~/.vim/.undo//
" backup directory
set backupdir=~/.vim/.backup//
" swap directory
set directory=~/.vim/.swp//


" Since Vim will source .vimrc from any directory you run Vim from, this is
" a potential security hole; so, you should consider setting secure option.
" This option will restrict usage of some commands in non-default .vimrc files;
" commands that write to file or execute shell commands are not allowed and map commands are displayed.
set secure


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

" tagbar config
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1
let g:tagbar_ctags_bin = $CTAGS_PATH
set tags=tags;

" vim indent guides for indentline plugin
" set to green the indent line
let g:indentLine_color_term = 23
" Set the specific character for indent guide
let g:indentLine_char = '|'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Handling of large files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" file is large from 50mb
let g:LargeFile = 1024 * 1024 * 50
augroup LargeFile 
autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
" no syntax highlighting etc
set eventignore+=FileType
" save memory when other file is viewed
setlocal bufhidden=unload
" is read-only (write with :w new_filename)
setlocal buftype=nowrite
" no undo possible
setlocal undolevels=-1
" no swap files
set noswapfile 
" display message
autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntatic and spell check
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_loc_list_height = 3
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_tex_checkers = ['lacheck', 'text/language_check']

let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Default is 2
let g:ycm_min_num_of_chars_for_completion = 3
" Default is 50
let g:ycm_max_num_candidates = 20

" Should point to the version used to compile YCM
let g:ycm_server_python_interpreter = '/usr/bin/python2'

"" Default is 1. Disable auto-trigger for completion. Can be triggered by <C-Space>
"let g:ycm_auto_trigger = 1
"" Default 0
"let g:ycm_autoclose_preview_window_after_completion = 0

" Spell checking
set spelllang=en_us             " English as default language
set complete+=kspell            " Word completion
set nospell                     " Disable by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" change leader to ,
let mapleader=","
" Clear search highlighting
"nnoremap <silent> <F2> :nohlsearch<CR>
" Edit-compile-edit cycle shortcuts
"nnoremap <F3> :make<CR>
"nnoremap <F4> :make run<CR>
"nnoremap <F5> :make clean<CR>
"nnoremap <F6> :make ctags<CR>
"nnoremap <F7> :cp<CR>
"nnoremap <F8> :cn<CR>
" Use ctrl-[hjkl] to select the active split!
"nnoremap <silent> <C-K> <C-W>k
"nnoremap <silent> <C-J> <C-W>j
"nnoremap <silent> <C-H> <C-W>h
"nnoremap <silent> <C-L> <C-W>l
"moving lines
"nnoremap <C-Down> :m+<CR>==
"nnoremap <C-Up> :m-2<CR>==
"inoremap <C-Down> <Esc>:m+<CR>==gi
"inoremap <C-Up> <Esc>:m-2<CR>==gi
"vnoremap <C-Down> :m'>+<CR>gv=gv
"vnoremap <C-Up> :m-2<CR>gv=gv
" These are command mapping used as an alternative for when the function keys are not available (i.e. on the macbook)
"nnoremap <silent> <leader>q :nohlsearch<CR>


"nnoremap <silent> <leader>a :NERDTreeToggle<CR>


"shortcut to tagbar
nmap <F9> :TagbarToggle<CR>

"shortcuts to open nerdtree
nnoremap <silent> <F8> :NERDTreeToggle<CR>
"map <C-n> :NERDTreeToggle<CR>


" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
"nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
"imap <F2> <ESC>:w<CR>i

" switch between header/source with F4
map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>

" create doxygen comment
map <F6> :Dox<CR>

" goto definition with F12
map <F12> <C-]>

"ctags maps
"open definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"open definition in a vertial split
map <C-/> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Tags tag to open selection with multiple tags of the same name are present. Otherwise go to the definition.
map <C-]> g<C-]>

"remap autocomplete shortcut from Ctrl-P to Ctrl-space
"inoremap <C-p> <>

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

" Toggle spell check
noremap <F7> :setlocal spell!<CR>
