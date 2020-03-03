
" +------------------------------------------------------------------------------------------------+
" | Python Function definitions                                                                    |
" +------------------------------------------------------------------------------------------------+

if !has('python')
  echo "Error: Required vim compiled with +python"
  finish
endif


  " +--------------------------------------------+
  " | Window Navigation                          |
  " +--------------------------------------------+

  function! NavScanTabsCommand(tabnr)
    if filereadable($HOME."/.vim/misc/Python/navscantabscommand.py")
      pyfile $HOME/.vim/misc/Python/navscantabscommand.py
    else
      call confirm("Error: helloworld.py cannot be found! Please reinstall the plugin", 'OK')
      finish
    endif
  endfunction

