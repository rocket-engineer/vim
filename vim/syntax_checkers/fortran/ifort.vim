"============================================================================
" File:        ifort.vim
" Description: Syntax checker plugin for FORTRAN using the
"              Intel FORTRAN Compiler
" Maintainer:  rocket-engineer (on github.com)
"
" License: This program is free software. It comes without any warranty,
"          to the extent permitted by applicable law. You can redistribute
"          it and/or modify it under the terms of the Do What The Fuck You
"          Want To Public License, Version 2, as published by Sam Hocevar.
"          See http://sam.zoy.org/wtfpl/COPYING for more details.
"============================================================================

"
if exists("g:loaded_syntastic_fortran_ifort_checker")
  finish
endif
let g:loaded_syntastic_fortran_ifort_checker=1

"
if !exists('g:syntastic_fortran_compiler_options')
  let g:syntastic_fortran_compiler_options = ''
endif

"
let s:save_cpo = &cpo
set cpo&vim

" check if checker is available
function! SyntaxCheckers_fortran_ifort_IsAvailable() dict
  if !exists('g:syntastic_fortran_compiler')
    let g:syntastic_fortran_compiler = self.getExec()
  endif
  call self.log('g:syntastic_fortran_compiler = ', g:syntastic_fortran_compiler)
  return executable(expand(g:syntastic_fortran_compiler))
endfunction

" define compiler checker flags and error format
function! SyntaxCheckers_fortran_ifort_GetLocList() dict

  " compiler flags
  let makeprg = self.makeprgBuild({
              \ "exe": self.getExec(),
              \ "args": "-syntax-only" })

  " error format
  let errorformat = 
    \ '%E%f(%l):\ %trror\ #%n:\ %m,%+C,%-C%p^,%Z,%-G%.%#'
  ""%C%-Z%p^'

    "
    " \ '%-C %#,'.
    " \ '%-C %#%.%#,'.
    " \ '%A%f:%l.%c:,'.
    " \ '%Z%trror: %m,'.
    " \ '%Z%tarning: %m,'.
    " \ '%-G%.%#'

  " execute compiler command
  return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })

endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'fortran',
    \ 'name': 'ifort' })

let &cpo = s:save_cpo
unlet s:save_cpo


" additiional features
  "            \ "post_args": "--more --args",
  "            \ "tail": "2>/dev/null"

