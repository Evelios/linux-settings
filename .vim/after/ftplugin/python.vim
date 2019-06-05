" Python Specific Standards conforming to PEP 8

" General
set fileformat=unix
set encoding=utf-8
set textwidth=79

" White Space
set tabstop=4         " The number of spaces a tab appears as
set softtabstop=4     " The number of spaces that are changed when tab is pressed
set shiftwidth=4      " The number of spaces to shift for automatic indentation
set expandtab         " Expand tabs out into spaces as indicated in the previous lines
set autoindent        " Turn on auto indenting to match the previous line
                      " Autoindent may need 'indentpython.vim' for better
                      " results

" Enable folding
set foldmethod=indent " This may need plugin 'SimplFold' for better results
