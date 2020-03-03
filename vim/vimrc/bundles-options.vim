
" +------------------------------------------------------------------------------------------------+
" | Plugin specific settings                                                                       |
" +------------------------------------------------------------------------------------------------+

if 1 == VimRCBundlesOptions

	if 1 == VimRCBundlesStandard

    " +------------------------------------------+
    " | NERDTree                                 |
    " +------------------------------------------+
   
   	" settings
    let g:NERDTreeWinSize = 40 													        " set the width of the tree
    let g:NERDTreeChDirMode = 2 												        " set current directory
    let NERDTreeShowBookmarks = 1 											        " always show bookmarks
    " let NERDTreeStatusline="huhu"
    let NERDTreeIgnore = ['.o$[[file]]'] 								        " ignore object files
    let g:nerdtree_tabs_open_on_console_startup = 1    	        " open NERDTree Tabs
   
    " keymaps
    nnoremap <silent> <F10> :NERDTreeTabsToggle<CR>
    inoremap <silent> <F10> <Esc>:NERDTreeTabsToggle<CR>
    vnoremap <silent> <F10> <Esc>:NERDTreeTabsToggle<CR>


    " +------------------------------------------+
    " | Airline                                  |
    " +------------------------------------------+
   
    " settings
    let g:airline#extensions#tabline#enabled = 1                " enable enhanced tab line
    let g:airline#extensions#tabline#show_buffers = 0		        "	enable buffers with a single tab
    let g:airline#extensions#tabline#tab_min_count = 0	        "	set tab_min_count to zero
    let g:airline#extensions#tabline#tab_nr_type = 1		        "	type how to calculate number
    let g:airline#extensions#tabline#fnamemod = ':t'            " just show the file name (no path) in the tab
    let g:airline#extensions#whitespace#enabled = 0             " disable whitespace checking
    let g:airline_powerline_fonts = 1                           " enable powerline fonts
    " let g:airline#extensions#syntastic#enabled = 1             " enable syntastic integration
    " let g:airline#extensions#tagbar#enabled = 1


    " +------------------------------------------+
    " | Indent Guides                            |
    " +------------------------------------------+
   
    " settings
    let g:indent_guides_enable_on_vim_startup = 0 			        " enable Indent Guides at vim startup
    let g:indent_guides_start_level = 2 								        " start indent guides at 2nd level
    let g:indent_guides_guide_size = 1 								          " use small indent guides
    let g:indent_guides_space_guides = 1 								        " don't care about spaces
    let g:indent_guides_auto_colors = 0                         " indent guides color definition
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237
    let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'conf']


    " +------------------------------------------+
    " | Indent Guides                            |
    " +------------------------------------------+
   
    " settings

	endif

endif


if 1 == VimRCBundlesOptions

	if 1 == VimRCBundlesDevel

    " +------------------------------------------+
    " | Tagbar                                   |
    " +------------------------------------------+
   
    " settings
    let g:tagbar_sort = 0   "
    let g:tagbar_iconchars = ['▸', '▾']                         " define Tagbar icon characters
    " autocmd FileType fortran,c,cpp,vim nested :TagbarOpen  " open Tagbar for these file types automatically
   
    " appearance
    hi TagbarHelp ctermfg=113
   
    " keymaps
    nnoremap <F11>      :call NavOpenCloseTagbar()<CR>
    inoremap <F11> <Esc>:call NavOpenCloseTagbar()<CR>
    vnoremap <F11> <Esc>:call NavOpenCloseTagbar()<CR>


    " +------------------------------------------+
    " | Rainbow                                  |
    " +------------------------------------------+
   
    " settings
    let g:rainbow_active = 0
   
    " define colors and what characters to color
    let g:rainbow_conf = {
    \ 'ctermfgs': ['yellow', 'red', 'magenta', 'cyan'],
    \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \ 'operators': '_,_',
    \ 'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
    \ 'separately': {
    \   '*': {},
    \   'lisp': {
    \     'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \     'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
    \   },
    \   'vim': {
    \     'parentheses': [['fu\w* \s*.*)','endfu\w*'], ['for','endfor'], ['while', 'endwhile'], ['if','_elseif\|else_','endif'], ['(',')'], ['\[','\]'], ['{','}']],
    \     },
    \   'tex': {
    \     'parentheses': [['(',')'], ['\[','\]'], ['\\begin{.*}','\\end{.*}']],
    \   },
    \   'css': 0,
    \   'stylus': 0,
    \ }
    \}
   
    " keymaps
    nnoremap <silent> <M-F8> :RainbowToggle<CR>
    inoremap <silent> <M-F8> <Esc>:RainbowToggle<CR>
    vnoremap <silent> <M-F8> <Esc>:RainbowToggle<CR>


    " +------------------------------------------+
    " | delimitMate                              |
    " +------------------------------------------+
   
    "let delimitMate_quotes = "\" '""'"
    let delimitMate_expand_space = 1                            " enable expansion of spaces and new lines
    let delimitMate_expand_cr = 1                               " enable expansion of spaces and new lines
    imap <C-b> <Plug>delimitMateS-Tab


    " +------------------------------------------+
    " | TComment                                 |
    " +------------------------------------------+
   
    " keymaps
    nmap <leader>c :TComment<CR>
    nmap <leader>= :TCommentBlock<CR>
    vmap <leader>c :TComment<CR>
    vmap <leader>= :TCommentBlock<CR>
   
    " define additional comment styles
    call tcomment#type#Define('chemkin','! %s' )
    call tcomment#type#Define('c',      '// %s')


    " +------------------------------------------+
    " | UltiSnips                                |
    " +------------------------------------------+
    
    " let g:UltiSnipsExpandTrigger="<tab>"                        " set UltiSnips trigger
    " let g:UltiSnipsJumpForwardTrigger="<c-n>"		        " set UltiSnips forward trigger
    " let g:UltiSnipsJumpBackwardTrigger="<c-m>"                  " set UltiSnips backward trigger
    " let g:UltiSnipsListSnippets="<c-tab>"			" set UltiSnips list command
    let g:UltiSnipsExpandTrigger="<c-w>"                        " set UltiSnips trigger
    let g:UltiSnipsJumpForwardTrigger="<tab>"		                " set UltiSnips forward trigger
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"                " set UltiSnips backward trigger
    " let g:UltiSnipsListSnippets="<c-tab>"			" set UltiSnips list command
    let g:UltiSnipsEditSplit="vertical"                         " open UltiSnips Edit Window vertically
    let g:UltiSnipsSnippetDirectories=["misc/UltiSnips"]        " set UltiSnips main directory
    let g:UltiSnipsSnippetsDir = "~/.vim/misc/UltiSnips"        " set UltiSnips directory for new snippets


    " +------------------------------------------+
    " | Syntastic                                |
    " +------------------------------------------+
   
    " general settings
    let syntastic_debug = 0                                     " enable debug mode (trace checker calls)
    " let g:syntastic_check_on_open = 1                           " enable syntax checking when opening files
    let g:syntastic_auto_loc_list = 1                           " error window opens and closes automatically
    let g:syntastic_loc_list_height = 8                         " error window height
    let g:syntastic_always_populate_loc_list = 1                " always populate errors to location list
    " let g:syntastic_disabled_filetypes=['']                     " disable Syntastic for specific file types
    
	  " appearance
    function! s:getbg(group)
      if has("gui_running")
        let l:mode = 'gui'
        let l:validation = '\w\+\|#\x\+'
      else
        let l:mode = 'cterm'
        let l:validation = '\w\+'
      endif
      if synIDattr(synIDtrans(hlID(a:group)), 'reverse', l:mode)
        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'fg', l:mode)
      else
        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'bg', l:mode)
      endif
      if l:bg == '-1' || l:bg !~ l:validation
        if synIDattr(synIDtrans(hlID('SignColumn')), 'reverse', l:mode)
          let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'fg', l:mode)
        else
          let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', l:mode)
        endif
      endif
      if l:bg == '-1' || l:bg !~ l:validation
    	  return ''
      endif
      return l:mode . 'bg=' . l:bg
    endfunction

    let g:syntastic_error_symbol = '✘'
    let g:syntastic_warning_symbol = '☢'
    hi! link SyntasticErrorLine Visual
    hi! link SyntasticWarningLine Visual
    exec 'hi! SyntasticErrorSign guifg=red ctermfg=red ' . s:getbg('SyntasticErrorLine')
    exec 'hi! SyntasticWarningSign guifg=yellow ctermfg=yellow ' . s:getbg('SyntasticWarningLine')
    exec 'hi! SyntasticError ' . s:getbg('SyntasticErrorLine')
    exec 'hi! SyntasticWarning ' . s:getbg('SyntasticWarningLine')
    highlight SyntasticError ctermfg=red
    highlight SyntasticWarning ctermfg=yellow

    " FORTRAN language settings
    let g:syntastic_fortran_checkers = ["gfortran"]                     " define FORTRAN checker
    " let g:syntastic_fortran_remove_include_errors = 1                 " disable include errors
    let g:syntastic_fortran_config_file = '.syntastic_fortran_config'   " define FORTRAN config file
    " let g:syntastic_fortran_include_dirs = [ '/opt/intel/impi_latest/include64' ]

    " C language settings
    let g:syntastic_c_checkers = ["gcc"]                               " define C checker
    " let g:syntastic_c_remove_include_errors = 1                      " disable include errors
    let g:syntastic_c_config_file = '.syntastic_c_config'              " define C config file

    " C++ language settings
    " let g:syntastic_cpp_checkers = ["g++"]                             " define C checker
    " let g:syntastic_cpp_remove_include_errors = 1                    " disable include errors
    let g:syntastic_cpp_config_file = '.syntastic_cxx_config'          " define C config file

    " CUDA language settings
    " let g:syntastic_cuda_check_header = 1
    " let g:syntastic_cuda_arch = 'sm_35c'
    " let g:syntastic_fortran_checkers = ["gcc"]                    " define Python checker

    " Python language settings
    let g:syntastic_python_checkers = ["python"]                  " define Python checker
    let g:syntastic_python_python_exec = '/usr/bin/python3'       " define Python executable
    let g:syntastic_python_config_file = '.syntastic_cpp_config'  " define Python config file


    " +------------------------------------------+
    " | YouCompleteMe                            |
    " +------------------------------------------+
   
    " settings
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' 	" locate global YCM config file
    let g:ycm_confirm_extra_conf = 0 													" don't ask for local config confirmation
    set pumheight=30 																					" limit popup menu height
    " let g:ycm_complete_in_comments = 0                      " enable YCM in comments
    let g:ycm_autoclose_preview_window_after_completion = 1 	" close preview window after completion
    let g:ycm_autoclose_preview_window_after_insertion = 1 		" close preview window after insertion
	  set ttimeoutlen=50 																				" for faster InsertLeave triggerin
    set conceallevel=2
    set concealcursor=vin
    let g:ycm_concealing_delimiters = ['⟪', '⟫'] 							" set concealing delimiters
    let g:ycm_extra_spacing = 1 															" one extra space between arguments
    let g:ycm_register_as_syntastic_checker = 0               " disable syntax checking in YCM
    let g:ycm_collect_identifiers_from_tags_files = 1         " enable collect data from tags files
    
    " diagnostics settings
    let g:ycm_show_diagnostics_ui = 0
    " let g:ycm_always_populate_location_list = 1
    " let g:ycm_open_loclist_on_ycm_diags = 1
   
    " make YCM compatible with UltiSnips (using Supertab)
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

    " YCM file type blacklist
    " let g:ycm_filetype_blacklist = {
    "       \ 'fortran' : 1
    "       \}


    " +------------------------------------------+
    " | Supertab                                 |
    " +------------------------------------------+
    
    " settings


    " +------------------------------------------+
    " | Vimtex                                   |
    " +------------------------------------------+
    
    " folding types
    let g:vimtex_fold_types = {
      \ 'envs' : {
      \   'blacklist' : ['equation', 'split', 'align', 'figure', 'table'],
      \ },
      \ 'sections' : {
      \   'parse_levels' : 0,
      \   'sections' : [
      \     'section',
      \     'subsection',
      \     'subsubsection',
      \   ],
      \ },
      \}

	endif

endif

