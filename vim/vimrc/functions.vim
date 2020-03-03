
" +------------------------------------------------------------------------------------------------+
" | Function definitions                                                                           |
" +------------------------------------------------------------------------------------------------+

  " +--------------------------------------------+
  " | General Functions                          |
  " +--------------------------------------------+

  " save file (Ctrl+s)
  fun! FileSave()
    echo "File has been written ..."
    update
  endf

  " close window (Ctrl+q)
  fun! FileClose()
    " do not close NERDTree (and Tagbar in developer mode)
    if (g:NERDTreeOn==1) && (winnr()==1)
      echo "Cannot close window! (is NERDTree ...)"
    elseif (g:TagbarOn==1) && (g:develmode==1) && (winnr()==bufwinnr("__Tagbar__"))
      echo "Cannot close window! (is Tagbar and you are running in developer mode ...)"
    else
      echo "File has been closed ..."
      " check whether a tab or a right window was closed
      call NavDetectClosedWin()
      quit
      exec("bwipe " . bufnr("$"))
      " move cursor to main window
      if (g:NERDTreeOn==1) && (winnr()==1)
        exe 2 . "wincmd w"
      endif
      " scan window environment
      call NavScanEnv()
    endif
"     " TODO: after tab was closed check for last(main)windows
  endfun

  " save file and close window (Ctrl+x)
  fun! FileSaveClose()
    call FileSave()
    call FileClose()
  endf

  " set development mode
  function! NavSetDevelMode()
    let g:develmode=1                                       " enable development mode
    call NavScanEnv()                                       " scan window environment
    let g:lastwin=2                                         " set last window variable to two
    let g:lastmainwin=2                                     " set last main window variable to two
    let g:tabcounter=1
    2wincmd w                                               " move cursor to (left) main window
    IndentGuidesEnable                                      " enable indent guides
  endfunction

  " set standard mode
  function! NavSetStandardMode()
"     let g:develmode=0                                       " enable development mode
"     let g:NERDTreeOn=1                                      " NERDTree is open (=1)
"     let g:TagbarOn=0                                        " Tagbar is open (=1)
"     let g:winright=2                                        " set window right variable to three
"     let g:twomainwins=1                                     " set two main window variable to one
"     let g:lastwin=2                                         " set last window variable to two
"     let g:lastmainwin=2                                     " set last main window variable to two
"     let g:tabcounter=1
"     2wincmd w                                               " move cursor to (left) main window
"     :TagbarOpen                                             " open Tagbar 
"     IndentGuidesEnable                                      " enable indent guides
  endfunction


  " +--------------------------------------------+
  " | Window Navigation                          |
  " +--------------------------------------------+

  " get number of last main window
  function! NavGetLastmainwin()
    return g:lastmainwin
  endfunction

  " get number of last window
  function! NavGetLastwin()
    return g:lastwin
  endfunction

  " Check whether a tab or a window was closed (before something happens)
  function! NavDetectClosedWin()
    let l:counter = winnr() - g:NERDTreeOn
    " check for closed tab
    if l:counter==1
      let g:tabcounter=g:tabcounter-1
    endif
    " check for closed 2nd main window
    if l:counter==2
      let g:twomainwins=1
    endif
  endfunction

  function! NavScanEnv()
    " scan window environment via Python script (using :tabs command)
    let l:tabnr = tabpagenr()
    :TagbarOpen
    call NavScanTabsCommand(l:tabnr)
    " open Tagbar when in development mode
    " if (g:develmode==1) && (g:TagbarOn==0)
    "   let g:TagbarOn = 1
    "   let g:winright = g:winright + 1
    " endif
  endfunction
  command! NavScanEnv call NavScanEnv()

  function! NavCheckLastWins()
"     " check last main window variable
"     if (g:twomainwins==2) && (winnr()!=1) && (winnr()!=g:winright)
"       if (winnr()==g:NERDTreeOn+1)
"         let g:lastmainwin=g:NERDTreeOn+g:locationlistleft+2
"       elseif(winnr()==g:NERDTreeOn+g:locationlistleft+2)
"         let g:lastmainwin=g:NERDTreeOn+1
"       else
"         echo "Error: NavScanEnv() has problems with check last main window variable!"
"       endif
"     else
"       let g:lastmainwin = g:NERDTreeOn+g:locationlistleft+2
"     endif
"     " check last window variable
"     g:lastwin = winnr()
  endfunction

  " show window information
  function! NavShowWinInfo()
    echo "Devel Mode:        "g:develmode
    echo "NERDTreeOn:        "g:NERDTreeOn
    echo "TagbarOn:          "g:TagbarOn
    echo "locationlistleft:  "g:locationlistleft
    echo "locationlistright: "g:locationlistright
    echo "winright:          "g:winright
    echo "twomainwins:       "g:twomainwins
    echo "tabcounter:        "g:tabcounter
    echo "Last Window:       "g:lastwin
    echo "Last Main Window:  "g:lastmainwin
    echo "Last Tab:          "g:lasttab
  endfunction 
  command! NavShowWinInfo call NavShowWinInfo()

  " switch to the left window 
  function! NavSwitchWinLeft()
    " scan current state (due to open location lists)
    call NavScanEnv()
    if(winnr()>1)
      let l:tmp=winnr()
      let l:targetwindow=l:tmp-1
      exe 1 . "wincmd h"
      let g:lastwin=l:tmp
      if (g:twomainwins==2) && ((l:tmp==2)||(l:tmp==3))
        let g:lastmainwin=l:tmp
      endif
      " scan new state
      call NavScanEnv()
      echo "Switched to left window!"
    else
      echo "Error: No left window found!"
    endif
  endfunction

  " switch to the right window 
  function! NavSwitchWinRight()
    " scan current state (due to open location lists)
    call NavScanEnv()
    if(winnr()<g:winright)
      let l:tmp=winnr()
      let l:targetwindow=l:tmp+1
      exe 1 . "wincmd l"
      let g:lastwin=l:tmp
      if (g:twomainwins==2) && ((l:tmp==2)||(l:tmp==3))
        let g:lastmainwin=l:tmp
      endif
      " scan new state
      call NavScanEnv()
      echo "Switched to right window!"
    else
      echo "Error: No right window found!"
    endif
  endfunction

  " switch to the lower window 
  function! NavSwitchWinDown()
    " scan current state (due to open location lists)
    call NavScanEnv()
    if (winnr()==2) && (g:locationlistleft==1)
      let l:tmp=winnr()
      exe 1 . "wincmd j"
      let g:lastwin=l:tmp
    elseif (g:twomainwins==2) && (winnr()==3) && (g:locationlistleft==0) && (g:locationlistright==1)
      let l:tmp=winnr()
      exe 1 . "wincmd j"
      let g:lastwin=l:tmp
    elseif (g:twomainwins==2) && (winnr()==4) && (g:locationlistleft==1) && (g:locationlistright==1)
      let l:tmp=winnr()
      exe 1 . "wincmd j"
      let g:lastwin=l:tmp
    else
      echo "Error: No lower window found!"
    endif
  endfunction

  " switch to the upper window 
  function! NavSwitchWinUp()
    " scan current state (due to open location lists)
    call NavScanEnv()
    if (winnr()==3) && (g:locationlistleft==1)
      let l:tmp=winnr()
      exe 1 . "wincmd k"
      let g:lastwin=l:tmp
    elseif (g:twomainwins==2) && (winnr()==4) && (g:locationlistleft==0) && (g:locationlistright==1)
      let l:tmp=winnr()
      exe 1 . "wincmd k"
      let g:lastwin=l:tmp
    elseif (g:twomainwins==2) && (winnr()==5) && (g:locationlistleft==1) && (g:locationlistright==1)
      let l:tmp=winnr()
      exe 1 . "wincmd k"
      let g:lastwin=l:tmp
    else
      echo "Error: No upper window found!"
    endif
  endfunction

  " switch to the left tab
  function! NavSwitchTabLeft()
    if tabpagenr("$")==1
      echo "Cannot switch to left tab!"
    else
      let g:lasttab=tabpagenr()
      " move cursor to last main window when it is currently located in Tagbar
      if(g:TagbarOn==1) && (winnr()==bufwinnr("__Tagbar__"))
        exe g:lastmainwin . "wincmd w"
        " let g:lastwin=bufwinnr("__Tagbar__")
      endif
      tabprevious
      echo "Switched to tab"tabpagenr()
      call NavScanEnv()
    endif
  endfunction

  " switch to the right tab
  function! NavSwitchTabRight()
    " command
    if tabpagenr("$")==1
      echo "Cannot switch to right tab!"
    else
      let g:lasttab=tabpagenr()
      " move cursor to last main window when it is currently located in Tagbar
      if(g:TagbarOn==1) && (winnr()==bufwinnr("__Tagbar__"))
        exe g:lastmainwin . "wincmd w"
        let g:lastwin=bufwinnr("__Tagbar__")
      endif
      tabnext
      echo "Switched to tab"tabpagenr()
      call NavScanEnv()
    endif
  endfunction

  " switch to tab directly
  function! NavSwitchTabDirect(tabnr)
    if a:tabnr!=tabpagenr()
      let g:lasttab=tabpagenr()
      exec("tabnext " . a:tabnr)
      echo "Switch to tab"a:tabnr"!"
    else
      echo "Already in tab"a:tabnr"!"
    endif
  endfunction

  " open/close Tagbar on/off
  function! NavOpenCloseTagbar()
"     if bufwinnr("__Tagbar__")<0
"       TagbarOpen
"       let g:TagbarOn=1
"       echo "Opened Tagbar window!" 
"     else
"       TagbarClose
"       let g:TagbarOn=0
"       echo "Closed Tagbar window!" 
"     endif
"     call NavScanEnv()
  endfunction

  " toggle with last tab
  function! NavToggleLastTab()
    if g:tabcounter>1
      let tmp=tabpagenr()
      exec("tabnext " . g:lasttab)
      let g:lasttab=tmp
      call NavScanEnv()
    else
      echo "Cannot toggle with last tab! There is only one tab available!"
    endif
  endfunction

  " toggle between main windows
  function! NavToggleMainwin()
    " scan current state (due to open location lists)
    call NavScanEnv()
    let l:tmp=winnr()-g:NERDTreeOn
    let l:tmp2=0
    if g:twomainwins==2
      " no switching when in NERDTree
      if winnr()==1 
        echo "Cannot switch from NERDTree to last main window !!!"
      " no switching when in Tagbar 
      elseif (winnr()==g:winright) && (g:TagbarOn==1)
        echo "Cannot switch from Tagbar to last main window !!!"
      " no switching when in location list 
      elseif (l:tmp==2) && (g:locationlistleft==1)
        echo "Cannot switch from location list to last main window !!!"
      elseif (l:tmp==3) && (g:locationlistleft==0) && (g:locationlistright==1)
        echo "Cannot switch from location list to last main window !!!"
      elseif (l:tmp==4) && (g:locationlistleft==1) && (g:locationlistright==1)
        echo "Cannot switch from location list to last main window !!!"
      elseif l:tmp==1 || l:tmp-g:locationlistleft==2
        let l:tmp2=g:lastmainwin
        let g:lastwin=winnr()
        let g:lastmainwin=winnr()
        exe l:tmp2 . "wincmd w"
        if l:tmp-g:locationlistleft==2
          echo "Switched to left main window!"
        elseif l:tmp==1
          echo "Switched to right main window!"
        else
          echo "02 Error: Problem in NavToggleLastmainwin() !!!"
        endif
      else 
        echo "01 Error: Problem in NavToggleLastmainwin() !!!"
      endif
    else
      echo "There is no right main window!"
    endif
  endfunction

  " toggle between NERDTree and last main window
  function! NavToggleNERDTree()
    " scan current state (due to open location lists)
    call NavScanEnv()
    if (exists(":NERDTree")) && (winnr()==1)
      let l:newlastwin=1
      exe g:lastwin . "wincmd w"
      echo "Toggled with NERDTree (bwd)"
      let g:lastwin=l:newlastwin
    elseif (exists(":NERDTree")) && (winnr()>1)
      let l:newlastwin=winnr()
      exe 1 . "wincmd w"
      echo "Toggled with NERDTree (fwd, from"l:newlastwin")"
      let g:lastwin=l:newlastwin
    elseif (exists(":NERDTree")) && (winnr()>g:winright)
      echo "Error 01: Somthing went wrong toggling NERDTree !!!"g:lastwin
    else
      echo "No NERDTree window available!"
    endif
  endfunction

  " toggle between Tagbar and last main window
  function! NavToggleTagbar()
    " scan current state (due to open location lists)
    call NavScanEnv()
    if (g:TagbarOn==1) && (winnr()==g:winright)
      let l:newlastwin=g:winright
      exe g:lastwin . "wincmd w"
      echo "Toggled with Tagbar (bwd)"
      let g:lastwin=l:newlastwin
    elseif (g:TagbarOn==1) && (winnr()<g:winright)
      let l:newlastwin=winnr()
      exe g:winright . "wincmd w"
      echo "Toggled with Tagbar (fwd, from"l:newlastwin")"
      let g:lastwin=l:newlastwin
    elseif (g:TagbarOn==1) && (winnr()>g:winright)
      echo "Error 01: Somthing went wrong toggling Tagbar !!!"
    else
      echo "No Tagbar window available!"
    endif
  endfunction

  " check if file is available
  function! NavCheckBufAvail(checkbuf)
    let out=0
    let c=1
    while c<=bufnr("$")
      if a:checkbuf==bufname(c)
        let out=1
        break
      endif
      let c+=1
    endwhile
    return out
  endfunction

  " new main window
  function! NavNewMainWin()
    if g:twomainwins==1
      vnew 
      let g:twomainwins=2
    elseif g:twomainwins==2
      echo "No more main window slots available!"
    else
      echo "Error 01: NavNewMainWin()"
    endif
  endfunction

  " new tab from NERDTree
  function! NavNewTab(filenode)
    if NavCheckBufAvail(a:filenode.displayString())==1
      echo "This file has already been opened!"
    else
      exec(tabpagenr("$") . "tabnew " . fnamemodify(a:filenode.path.str(), ':.'))
      let g:tabcounter=g:tabcounter+1
      call NavScanEnv()
    endif
  endfunction

  " new tab from NERDTree (silently)
  function! NavNewTabSilent(filenode)
"     if NavCheckBufAvail(a:filenode.displayString())==1
"       echo "This file has already been opened!"
"     else
"       let l:tabbefore=tabpagenr()
"       exec(tabpagenr("$") . "tabnew " . fnamemodify(a:filenode.path.str(), ':.'))
"       exec("tabnext " . l:tabbefore)
"       exec(1 . "wincmd w")
"       let g:tabcounter=g:tabcounter+1
"       call NavScanEnv()
"     endif
  endfunction

  " new main window from NERDTree
  function! NavNewSplitWin(filenode)
    if NavCheckBufAvail(a:filenode.displayString())==1
      echo "This file has already been opened!"
    else
      if g:twomainwins==1
        exec(2 . "wincmd w")
        exec("rightbelow vsplit " . fnamemodify(a:filenode.path.str(), ':.'))
      elseif g:twomainwins==2
        echo "No more main window slots available!"
      else
        echo "01 Error: Problem in NavNewSplitWinSilent !!!"
      endif
      call NavScanEnv()
    endif
  endfunction

  " new main window from NERDTree (silently)
  function! NavNewSplitWinSilent(filenode)
"     if NavCheckBufAvail(a:filenode.displayString())==1
"       echo "This file has already been opened!"
"     else
"       if g:twomainwins==1
"         exec(2 . "wincmd w")
"         exec("rightbelow vsplit " . fnamemodify(a:filenode.path.str(), ':.'))
"         exec(1 . "wincmd w")
"       elseif g:twomainwins==2
"         echo "No more main window slots available!"
"       else
"         echo "01 Error: Problem in NavNewSplitWinSilent !!!"
"       endif
"       call NavScanEnv()
"     endif
  endfunction

  " jump to underlying tag by opening in second main windows
  function! NavTagInRightMainWin()
    " check if second main window is available
    if g:twomainwins==1
      " open tag in second main window
      :let l:word=expand("<cword>")
      :vnew
      exec("tjump " . l:word)
      " check new environment
      call NavScanEnv()
    elseif g:twomainwins==2
      echo "No more main window slots available!"
    else
      echo "01 Error: Problem in NavTagInRightMainWin !!!"
    endif
  endfunction


  " +--------------------------------------------+
  " | Syntastic                                  |
  " +--------------------------------------------+

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


  " +--------------------------------------------+
  " | Vim environment                            |
  " +--------------------------------------------+

  " include the gutter (and line number panel) into error line highlighting
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
  

  " +--------------------------------------------+
  " | Misc                                       |
  " +--------------------------------------------+

  " Color test: Save this file, then enter ':so %'
  " Then enter one of following commands:
  " :VimColorTest
  fun! VimColorTest(outfile, fgend, bgend)
   	let result = []
 	  for fg in range(a:fgend)
      for bg in range(a:bgend)
        let kw = printf('%-7s', printf('c_%d_%d', fg, bg))
        let h = printf('hi %s ctermfg=%d ctermbg=%d', kw, fg, bg)
        let s = printf('syn keyword %s %s', kw, kw)
        call add(result, printf('%-32s | %s', h, s))
      endfor
 	  endfor
 	  call writefile(result, a:outfile)
 	  execute 'edit '.a:outfile
 	  source %
  endfun
  " Increase numbers in next line to see more colors.
  command! VimColorTest call VimColorTest('vim-color-test.tmp', 12, 16)

  " show syntax highlight group
  function! SyntaxItem()
    return synIDattr(synID(line("."),col("."),1),"name")
  endfunction
  " corresponding function invoke
  command! SyntaxItem echo(SyntaxItem())

  " If only 2 windows left, NERDTree and Tag_List, close vim or current tab
  " fun! NoExcitingBuffersLeft()
    " echo "That's it!"winnr("$")
    " if winnr("$") == 3
    "   let w1 = bufname(winbufnr(1))
    "   let w2 = bufname(winbufnr(2))
    "   let w3 = bufname(winbufnr(3))
    "   " echo w1" "w2" "w3
    "   if (exists(":NERDTree")) && (w1 == "__Tag_List__" || w2 == "__Tag_List__" || w3 == "__Tag_List__")
    "     " echo "tabpgenrs: "tabpagenr("$")
    "     if tabpagenr("$") == 1
    "       " echo "quitall: "w2
    "       exec 'TlistToggle'
    "     else
    "       " echo "tabclose!"
    "       exec 'TlistToggle'
    "     endif
    "   endif
    " endif
  " endfun
  " autocmd BufWinLeave * call NoExcitingBuffersLeft()
  " command! Quitbufs call NoExcitingBuffersLeft()
  
