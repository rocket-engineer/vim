
" +------------------------------------------------------------------------------------------------+
" | General                                                                                        |
" +------------------------------------------------------------------------------------------------+

" +----------------------------------------------+
" | Essential Settings                           |
" +----------------------------------------------+

set mouse=a                               " enable mouse
set ttymouse=urxvt
set mousehide                             " hide the mouse cursor while typing
set updatetime=500                        " set update time
" set paste                               " enable more convenient paste mode
set showcmd                               " show command line
set encoding=utf-8                        " set coding set
set clipboard=unnamed                     " copy stuff to clipboard
"set backspace=2                          " make backspace work like most other applications
"set autoread                              " auto read external file changes
set history=1000                          " keep 100 lines of history
let mapleader=","                         " define map leader key

" status line settings (disabled when airline is enabled)
set laststatus=2 													" enable status line
set statusline=%<%f\ 											" filename
set statusline+=%w%h%m%r 									" options
"set statusline+=%{fugitive#statusline()} " git Hotness
set statusline+=\ [%{&ff}/%Y] 						" file type
set statusline+=\ [%{getcwd()}] 					" current directory
set statusline+=%=%-14.(%l,%c%V%)\ %p%% 	" right aligned file type info

" file directories
set noswapfile                            " No swap file
set backup                                " make backup files
set backupdir=~/.vim/backup/              " put backup files in backup directory
set directory=~/.vim/tmp/                 " put swap files in temp directory
set viewdir=~/.vim/views/                 " put view files in views directory

" window settings                     
set splitbelow                            " add new window to the bottom
set splitright                            " add new window to the right

"-->  ruler settings
"set ruler  																					" enable ruler
"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) 	" A ruler on steroids
"set showcmd   																			" show command line

" initialize variables
let g:develmode=0                         " disable development mode
let g:lastmainwin=1                       " initialize last main window variable
let g:lastwin=1                           " initialize last window variable
let g:lasttab=1                           " initialize last tab variable
let g:NERDTreeOn=0
let g:TagbarOn=0
let g:winright=2
let g:twomainwins=1                       " two main windows indicator (1=one | 2=two main windows)
let g:tabcounter=1
let g:locationlistleft=0                  " there is no 
let g:locationlistright=0
let g:count=0



" +----------------------------------------------+
" | Appearance Settings                          |
" +----------------------------------------------+

syntax on                       " enable syntax
set t_Co=256                    " set number of colors
set number                      " enable row numbers
set cursorline                  " show cursor line
set wildmenu                    " enable wild menu
set tabstop=2                   " set number of spaces for tab stop
set shiftwidth=2                " 
set expandtab                   " convert tabs to spaces
set autoindent                  " auto indent after new line
"set cindent                     " enable indent for C code

" additional colors
if !exists("autocmd_colorscheme_loaded")
  let autocmd_colorscheme_loaded = 1
  " TODO
  autocmd ColorScheme * highlight Todo	  ctermfg=232	 ctermbg=220	cterm=bold
  " overlength
  autocmd ColorScheme * highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  " parallel standards
  autocmd ColorScheme * highlight MPIn 		ctermfg=40 								cterm=none
  autocmd ColorScheme * highlight MPIb 		ctermfg=40 								cterm=bold
  autocmd ColorScheme * highlight OpenMPn	ctermfg=27 								cterm=none
  autocmd ColorScheme * highlight OpenMPb	ctermfg=27 								cterm=bold 			
  autocmd ColorScheme * highlight CUDAn		ctermfg=201               cterm=none
  autocmd ColorScheme * highlight CUDAb		ctermfg=201               cterm=bold
  autocmd ColorScheme * highlight NetCDFn	ctermfg=160               cterm=none
  autocmd ColorScheme * highlight NetCDFb	ctermfg=160               cterm=bold
endif

" load color scheme
colorscheme wombat256

" add new keywords
autocmd Syntax * call matchadd('Todo', 'TODO:')
autocmd Syntax * call matchadd('Todo', 'FIXME:')
" match OverLength /\%111v.\+/

" --> UI settings
"" set background=dark 						" set dark color scheme
"" set guifont=Inconsolata 				" default gui font

" --> indent rules
"":nmap <tab> ==									" enable emacs-like indenting 



" +----------------------------------------------+
" | Folding Settings                             |
" +----------------------------------------------+

" disable folding for multicolumn comments
:let c_no_comment_fold = 1

" --> folding rules
set foldmethod=syntax
""set foldlevel=5

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window.
"autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
"autocmd InsertLeave * let &l:foldmethod=w:last_fdm

" --> FORTRAN specific
let fortran_fold=1                   		" activate folding in FORTRAN
"let fortran_more_precise=1           		" more syntax coloring in FORTRAN

" --> highlight on overlength
set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%132v.\+/

" save and re-open folding
""au BufWinLeave * mkview
""au BufWinEnter * silent loadview

" set tags files
set tags=./.tags;/,.tags;/


" +----------------------------------------------+
" | Spell Checking                               |
" +----------------------------------------------+

let g:tex_conceal = ""

set spell " enable spell checking

" set spelling data
set spelllang=my,en_us,de_20
" set spellfile=$SEAFILE_DATA/Misc/Spell/en.utf-8.add
set spellfile="/home/man-behind-moon/.vim/spell/my.utf-8.add"

" exclude words with 
" :syn match myExNonWords +\<\p*[^A-Za-z \t]\p*\>+ contains=@NoSpell

