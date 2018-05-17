"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" change leader to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

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

" F4 - switch between header/source with F4
map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
" F5 - recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" F6 - create doxygen comment
map <F6> :Dox<CR>
" F7 - Toggle spell check
noremap <F7> :setlocal spell!<CR>
" F8 - Open nerdtree
nnoremap <silent> <F8> :NERDTreeToggle<CR>
" F9 - Tagbar
nmap <F9> :TagbarToggle<CR>
" F12 - goto definition with F12
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

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 
