" Vim searching with the `All` command
"
" Description:
"   Search all occurances of a file for a key word and bring up the help
"   window with the results.
"
" Usage:
"   :All expression

" Abort if running vi-compatible mode or the user doesn't want to use it
 if &cp || exists('g:all_plugin_loaded')
   finish
 endif

 let g:all_plugin_loaded = 1

function! All(search)

  " Grab the syntax of the current file
  let l:prev_syntax=&filetype

  " Search for the input string
  execute "vimgrep /" . a:search . "/ %"

  " Open the quickfix in an new tab
  set switchbuf+=usetab,newtab
  tab copen

  " Set the syntax of the quickfix window to the current syntax
  execute "set syntax=" . l:prev_syntax

  " Conceal the file name and line numbers
  syntax match ConcealedDetails /\v^[^|]*\|[^|]*\| / conceal
  set conceallevel=2
  set concealcursor=nvic

  " Turn off the line highlighting for the quickfix window
  hi QuickFixLine cterm=None ctermbg=256 guibg=#ffff00

  " Allow the quickfix wondow to be modifiable
  set modifiable

endfun

command! -nargs=1 All :call All('<args>')
