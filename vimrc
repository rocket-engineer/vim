
"    +-------------------------------------+
"    |                  _                  |
"    |        __ ____  (_) ____ ___        |
"    |        _ | / / / / / __ `__ \       |
"    |        _ |/ / / / / / / / / /       |
"    |        ____/ /_/ /_/ /_/ /_/        |
"    |                                     |
"    |       - Configuration File -        |
"    |                                     |
"    +-------------------------------------+



" +------------------------------------------------------------------------------------------------+
" | Maintainer: rocket-engineer                                                                    |
" | Version: 0.5                                                                                   |
" | Last Change: 10/04/2014 10:54:00 PM                                                            |
" +------------------------------------------------------------------------------------------------+


" +------------------------------------------------------------------------------------------------+
" | General                                                                                        |
" +------------------------------------------------------------------------------------------------+

" be improved, required
set nocompatible

" load vimrc config file
so ~/.vim/vimrc/vim-conf.vim


" +------------------------------------------------------------------------------------------------+
" | Plugin administration                                                                          |
" +------------------------------------------------------------------------------------------------+

" required for vundle (add vundle in runtime path and initialize it)
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Load vimrc bundles declarations
so ~/.vim/vimrc/bundles.vim

call vundle#end()
filetype plugin indent on


" +------------------------------------------------------------------------------------------------+
" | Load chosen functionality                                                                      |
" +------------------------------------------------------------------------------------------------+

" load user defined pre vim config
if filereadable(glob("~/.vim/vimrc/vim.pre.conf"))
	so ~/.vim/vimrc/vim.pre.conf
endif

if 1 == VimRCPython
	so ~/.vim/vimrc/python.vim
endif

if 1 == VimRCFunctions
	so ~/.vim/vimrc/functions.vim
endif

if 1 == VimRCStandard
	so ~/.vim/vimrc/standard.vim
endif

if 1 == VimRCDevel
	so ~/.vim/vimrc/devel.vim
endif

if 1 == VimRCFiletypes
	so ~/.vim/vimrc/filetypes.vim
endif

if 1 == VimRCKeymap
	so ~/.vim/vimrc/keymap.vim
endif

if 1 == VimRCBundlesOptions
	so ~/.vim/vimrc/bundles-options.vim
endif

" load user defined post vim config
if filereadable(glob("~/.vim/vimrc/vim.post.conf"))
	so ~/.vim/vimrc/vim.post.conf
endif
