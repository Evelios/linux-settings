" Perl Specific File Commands

" Compile the current perl program
"nnoremap <leader>s :! perl -c % <cr>

" Run the current perl program
"nnoremap <leader>o :! perl % <cr>

" Output the TDS Messaging Statement
"nnoremap <leader>p aMSG("I:");<esc>hh
