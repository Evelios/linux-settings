" Vim searching with the `All` command
"
" Description:
"   Search all occurances of a file for a key word and bring up the help
"   window with the results.
"
" Usage:
"   :All expression

" Abort if running vi-compatible mode or the user doesn't want to use it
" if &cp || exists('g:all_plugin_loaded')
  " finish
" endif

" let g:all_plugin_loaded = 1

function! All(search)
  execute "vimgrep /" . a:search . "/ %"
  copen
endfun

command! -nargs=1 All call All('<args>')
