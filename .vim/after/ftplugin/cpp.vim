" C++ Specific Commands

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun

nnoremap <leader>lf :call ShowFuncName() <CR>

" Outout the TDS specific print statement
nnoremap <leader>m aMSG(SEV_I, (""));<esc>hhh
