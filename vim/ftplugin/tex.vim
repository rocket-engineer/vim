
" +------------------------------------------------------------------------------------------------+
" | File type Tex specific settings                                                                |
" +------------------------------------------------------------------------------------------------+

set colorcolumn=111

set foldmethod=expr
set foldexpr=vimtex#fold#level(v:lnum)
set foldtext=vimtex#fold#text()

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

