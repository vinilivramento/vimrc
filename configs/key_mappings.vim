"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

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

" F7 - Toggle spell check
noremap <F7> :setlocal spell!<CR>

"ctags maps
"open definition in a new tab
map <C-/> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"open definition in a vertial split
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Tags tag to open selection with multiple tags of the same name are present. Otherwise go to the definition.
map <C-]> g<C-]>

" Useful mappings for managing tabs
nnoremap <Tab> :tabnext<CR> 
nnoremap <S-Tab> :tabprevious<CR>

" Mappings for opening terminal
nnoremap <leader><leader>v :vertical terminal<CR>
nnoremap <leader><leader>s :terminal<CR>
