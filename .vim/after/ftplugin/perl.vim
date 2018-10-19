" Perl Specific File Commands

" Compile the current perl program
nnoremap <leader>s :! perl -c % <cr>

" Output the TDS Messaging Statement
nnoremap <leader>p aMSG("I:");<esc>hh
