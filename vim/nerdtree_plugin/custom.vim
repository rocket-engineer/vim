call NERDTreeAddKeyMap({
       \ 'key': 's',
       \ 'callback': 'NavNewSplitWin',
       \ 'quickhelpText': 'open vsplit',
       \ 'scope': 'FileNode',
       \ 'override': '1' })

call NERDTreeAddKeyMap({
       \ 'key': 'S',
       \ 'callback': 'NavNewSplitWinSilent',
       \ 'quickhelpText': 'open vsplit silently',
       \ 'scope': 'FileNode',
       \ 'override': '1' })

call NERDTreeAddKeyMap({
       \ 'key': 't',
       \ 'callback': 'NavNewTab',
       \ 'quickhelpText': 'open in new tab',
       \ 'scope': 'FileNode',
       \ 'override': '1' })

call NERDTreeAddKeyMap({
       \ 'key': 'T',
       \ 'callback': 'NavNewTabSilent',
       \ 'quickhelpText': 'open in new tab silently',
       \ 'scope': 'FileNode',
       \ 'override': '1' })

" call NERDTreeAddKeyMap({
"        \ 'key': '<C-k>',
"        \ 'callback': 'NavToggleMainwin',
"        \ 'quickhelpText': 'toggles with last main win',
"        \ 'scope': 'all',
"        \ 'override': '1' })
"
" call NERDTreeAddKeyMap({
"        \ 'key': '<C-j>',
"        \ 'callback': 'NavToggleLastTab',
"        \ 'quickhelpText': 'toggles with last main win',
"        \ 'scope': 'all',
"        \ 'override': '1' })

