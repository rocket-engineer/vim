
" +-------------------------------------------------------------------------------------------------
" | Bundles Config
" +-------------------------------------------------------------------------------------------------

if 1 == VimRCBundlesStandard

  " NERDTree:	Explorer for vim
  Plugin 'scrooloose/nerdtree'

  " NERDTreeTabs: Handles NERDTree with tabs
  Plugin 'jistr/vim-nerdtree-tabs'

  " Airline: Modified tab lines
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  " Tmuxline: Tmux status line generator and airline integration
  Plugin 'edkolev/tmuxline.vim'

  " Fixkey: this package makes it possible to use ALT-Keys
  Plugin 'drmikehenry/vim-fixkey'

  " Indent Guides: Visually displaying indent levels
  Plugin 'nathanaelkane/vim-indent-guides'

  " Obsession: Writes the current state of Vim
  "Plugin 'tpope/vim-obsession'

  " Surround: Delete, change and add surroundings to string
  Plugin 'surround.vim'

  " EasyMotion: Jump to words as easy as possible
  Plugin 'Lokaltog/vim-easymotion'

  " Fugitive: Git integration into vim
  "Plugin 'tpope/fugitive'

  " Vimshell:
  "Plugin 'Shougo/vimshell.vim'

  " Whitespace: Get rid of trailing whitespace at ease
  " Plugin 'ntpeters/vim-better-whitespace'

  " Xterm_color_table: Shows the 256 colors of vim and their corresponding numbers
  Plugin 'guns/xterm-color-table.vim'

  "Plugin 'godlygeek/tabular'
  "Plugin 'tpope/vim-eunuch'

endif


if 1 == VimRCBundlesDevel

  " Tagbar: Lists all tags of a source file
  Plugin 'majutsushi/tagbar'

  " Rainbow: Colorizes parentheses, brackets etc.
  Plugin 'luochen1990/rainbow'

  " DelimitMate: Closes strings etc.
  Plugin 'Raimondi/delimitMate'

  " TComment: provides file-type sensible comments
  Plugin 'tomtom/tcomment_vim'

  " UltiSnips: Code Snippets
  Plugin 'SirVer/ultisnips'
  " Plugin 'honza/vim-snippets'

  " Syntastic: On the fly syntax checking
  Plugin 'scrooloose/syntastic'

  " YouCompleteMe: Auto Completion for C-Semantic languages
  Plugin 'Valloric/YouCompleteMe'
  "Plugin 'oblitum/YouCompleteMe'

  " SuperTab: Brings all TAB-Key based plugins together
  Plugin 'ervandew/supertab'

  " Clang Format: Formats C++ code with specific coding style
  "Plugin 'rhysd/vim-clang-format'

  " SingleCompile: Makes it more convenient to compile
  "Plugin 'xuhdev/SingleCompile'

  " vimtex: Better latex support for vim
  Plugin 'lervag/vimtex'

endif

