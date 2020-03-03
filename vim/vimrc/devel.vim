
" +------------------------------------------------------------------------------------------------+
" | Development Settings                                                                           |
" +------------------------------------------------------------------------------------------------+

" +----------------------------------------------+
" | Vim environment                              |
" +----------------------------------------------+

" close vim when there would be NERDTree and Taglist only after closing a tag

" +----------------------------------------------+
" | CTags                                        |
" +----------------------------------------------+

" set tags file

" establish new ctags database for Theta
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>	ctags -L flist


" +----------------------------------------------+
" | Jumping around                               |
" +----------------------------------------------+

" open definition in splitted tab/new tab
map <F3> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <A-F3> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" jump between files in path
nnoremap <F2> :vertical wincmd f<CR>
nnoremap <A-F2> :tab wincmd f<CR>

" jump back up in the stack
"map <C-[> <C-t>

