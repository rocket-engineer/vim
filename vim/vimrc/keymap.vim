  
" +------------------------------------------------------------------------------------------------+
" | Key Mappings                                                                                   |
" +------------------------------------------------------------------------------------------------+


" +----------------------------------------------+
" | Send keys to TMux                            |
" +----------------------------------------------+

" make vim aware of screen sequences
if &term =~ '^screen' && exists('$TMUX')

    " TMux will send xterm-style keys when xterm-keys is on
    set ttymouse=xterm2

    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    execute "set <xHome>=\e[1;*H"
    execute "set <xEnd>=\e[1;*F"
    execute "set <Insert>=\e[2;*~"
    execute "set <Delete>=\e[3;*~"
    execute "set <PageUp>=\e[5;*~"
    execute "set <PageDown>=\e[6;*~"
    execute "set <xF1>=\e[1;*P"
    execute "set <xF2>=\e[1;*Q"
    execute "set <xF3>=\e[1;*R"
    execute "set <xF4>=\e[1;*S"
    execute "set <F5>=\e[15;*~"
    execute "set <F6>=\e[17;*~"
    execute "set <F7>=\e[18;*~"
    execute "set <F8>=\e[19;*~"
    execute "set <F9>=\e[20;*~"
    execute "set <F10>=\e[21;*~"
    execute "set <F11>=\e[23;*~"
    execute "set <F12>=\e[24;*~"
endif


" +----------------------------------------------+
" | General Mappings                             |
" +----------------------------------------------+

" Ctrl-c for switching in Normal Mode
inoremap <silent> <C-c> <Esc>:echo "Switched in Normal Mode!"<CR>
vnoremap <silent> <C-c> <Esc>:echo "Switched in Normal Mode!"<CR>

" Ctrl-s for saving
nnoremap <C-s> :call FileSave()<CR>
vnoremap <C-s> <Esc>:call FileSave()<CR>
inoremap <C-s> <Esc>:call FileSave()<CR>

" Ctrl-q for closing
nnoremap <C-q> :call FileClose()<CR>
vnoremap <C-q> <Esc>:call FileClose()<CR>
inoremap <C-q> <Esc>:call FileClose()<CR>

" Ctrl-x for saving and closing
nnoremap <C-x> :call FileSaveClose()<CR>
vnoremap <C-x> <Esc>:call FileSaveClose()<CR>
inoremap <C-x> <Esc>:call FileSaveClose()<CR>

" open help in a vertical split with :Help or :H
command! -nargs=* -complete=help Help vertical belowright help <args>
command! -nargs=* -complete=help H vertical belowright help <args>

" break the habit of reaching for the arrow keys (disable arrow keys)
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" toggle paste mode
" TODO: better routine !!!
set pastetoggle=<F8>


" +----------------------------------------------+
" | Tab Mappings                                 |
" +----------------------------------------------+

" open new tab
nnoremap <leader>d :tabnew<CR>
inoremap <leader>d :tabnew<CR> 
vnoremap <leader>d :tabnew<CR> 

" switch to next tab
nnoremap <C-l> :call      NavSwitchTabRight()<CR>
vnoremap <C-l> <Esc>:call NavSwitchTabRight()<CR>
inoremap <C-l> <Esc>:call NavSwitchTabRight()<CR>

" switch to previous tab
nnoremap <C-h> :call      NavSwitchTabLeft()<CR>
vnoremap <C-h> <Esc>:call NavSwitchTabLeft()<CR>
inoremap <C-h> <Esc>:call NavSwitchTabLeft()<CR>

" toggle with last tab
nnoremap <C-j> :call      NavToggleLastTab()<CR>
vnoremap <C-j> <Esc>:call NavToggleLastTab()<CR>
inoremap <C-j> <Esc>:call NavToggleLastTab()<CR>

" switch to different tab
map <silent> <leader>1 :call NavSwitchTabDirect(1)<CR>
map <silent> <leader>2 :call NavSwitchTabDirect(2)<CR>
map <silent> <leader>3 :call NavSwitchTabDirect(3)<CR>
map <silent> <leader>4 :call NavSwitchTabDirect(4)<CR>
map <silent> <leader>5 :call NavSwitchTabDirect(5)<CR>
map <silent> <leader>6 :call NavSwitchTabDirect(6)<CR>
map <silent> <leader>7 :call NavSwitchTabDirect(7)<CR>
map <silent> <leader>8 :call NavSwitchTabDirect(8)<CR>
map <silent> <leader>9 :call NavSwitchTabDirect(9)<CR>
map <silent> <leader>0 :call NavSwitchTabDirect(0)<CR>

" move tab to the left
nnoremap <silent> <C-Left> :tabm -1<CR>
inoremap <silent> <C-Left> :tabm -1<CR>

" move tab to the right
nnoremap <silent> <C-Right> :tabm +1<CR>
inoremap <silent> <C-Right> :tabm +1<CR>


" +----------------------------------------------+
" | Window Mappings                              |
" +----------------------------------------------+

" open new main window
nnoremap <leader>a      :call NavNewMainWin()<CR>
inoremap <leader>a <Esc>:call NavNewMainWin()<CR>
vnoremap <leader>a <Esc>:call NavNewMainWin()<CR>

" move cursor to the left/right/lower/upper windows
nnoremap <M-a>      :call NavSwitchWinLeft()<CR>
inoremap <M-a> <Esc>:call NavSwitchWinLeft()<CR>
vnoremap <M-a> <Esc>:call NavSwitchWinLeft()<CR>
nnoremap <M-d>      :call NavSwitchWinRight()<CR>
inoremap <M-d> <Esc>:call NavSwitchWinRight()<CR>
vnoremap <M-d> <Esc>:call NavSwitchWinRight()<CR>
nnoremap <M-s>      :call NavSwitchWinDown()<CR>
inoremap <M-s> <Esc>:call NavSwitchWinDown()<CR>
vnoremap <M-s> <Esc>:call NavSwitchWinDown()<CR>
nnoremap <M-w>      :call NavSwitchWinUp()<CR>
inoremap <M-w> <Esc>:call NavSwitchWinUp()<CR>
vnoremap <M-w> <Esc>:call NavSwitchWinUp()<CR>

" toggle left/right main window
nnoremap <C-k>      :call NavToggleMainwin()<CR>
inoremap <C-k> <Esc>:call NavToggleMainwin()<CR>
vnoremap <C-k> <Esc>:call NavToggleMainwin()<CR>

" toggle NERDTree window
nnoremap <C-a>      :call NavToggleNERDTree()<CR>
inoremap <C-a> <Esc>:call NavToggleNERDTree()<CR>
vnoremap <C-a> <Esc>:call NavToggleNERDTree()<CR>

" toggle Tagbar window
nnoremap <C-o>      :call NavToggleTagbar()<CR>
inoremap <C-o> <Esc>:call NavToggleTagbar()<CR>
vnoremap <C-o> <Esc>:call NavToggleTagbar()<CR>

" swap left/right window
" nnoremap <M-S-j> <C-W>x	          " swap current window with next one
" inoremap <M-S-j> <Esc><C-W>x	    " swap current window with next one

" break out current window into a new tab
nnoremap <M-S-c> <C-W>T	          " break out current window into a new tabview
inoremap <M-S-c> <Esc><C-W>T	    " break out current window into a new tabview



" +----------------------------------------------+
" | Tag Management                               |
" +----------------------------------------------+

" open tag in same main window (and check for multiple tags)
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

" open tag in second main win
nnoremap <C-w>] :call NavTagInRightMainWin()<CR>

" jump back in tag stack


" +----------------------------------------------+
" | Folding Mappings                             |
" +----------------------------------------------+

" Set fold level
"" map <silent> <F2> :set foldmethod=indent<CR>
"" map <silent> <F3> :set foldlevel=2<CR>
"" map <silent> <F4> :set foldlevel=3<CR>
"" map <silent> <F5> :set foldlevel=4<CR>
"" map <silent> <F6> :set foldlevel=5<CR>
"" map <silent> <F7> :set foldlevel=6<CR>
"" map <silent> <F8> :set foldlevel=7<CR>


" +----------------------------------------------+
" | Pasting Mappings                             |
" +----------------------------------------------+

"" Paste block while inserting new lines to hold it
"" nnoremap <Leader>p :call FancyPaste('*')<CR>
"" nnoremap <Leader>P :call FancyPaste('+')<CR>

"" a more advanced paste function in order to prevent 
"" function! FancyPaste(reg)
""     let paste = split(getreg(a:reg), '\n')
""     let spaces = repeat(' ', virtcol('.')-1)
""     call map(paste, 'spaces . v:val')
""     call append(line('.'), paste)
"" endfunction

