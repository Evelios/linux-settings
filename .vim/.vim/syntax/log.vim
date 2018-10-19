if exists("b:current_syntax")
  finish
endif

" ---- Syntax Declerations ----

" Comments
syn match Comment '\v\+\-+'   " Lines starting with    +---
syn match Comment '\v\-+'     " Dashed seperator lines ---
syn match Comment '\v^\s*\|.*$'  " Lines starting with    |
syn match Comment '\v^\s*\#.*$'  " Lines starting with    #
syn match Comment '\v^\s*\*.*$'  " Lines starting with    *
syn match Comment '\v//.*$'   " C style comments       //

" Misc
syn match dir       '\v\/[[:alnum:]]+\/[[:alnum:]_@\/\-\.]+'
syn match quote     '\v\".*\"'       " Double Quote
syn match quote     '\v\'.*\''       " Single Quote
syn match list      '\v^\s+[\-\+]\s' " Match lists starting with - or +
syn match log_opers '\v\@|\=|:|;|\>|\<|,'            " Match various operators in logfiles
syn match functionName '\v\[\w+\]($)@=' " The function call printed from MSG statements
syn region parens start="(" end=")" oneline contains=log_val

" Log variables and values
syn match log_var '\v\$?\w+(\s*\=\s*)@=' nextgroup=log_eq skipwhite
syn match log_eq  '\v\='              nextgroup=log_val skipwhite
syn match log_val '\v\w+(\.|\w)*'      contained display

" Messaging Levels
syn match info   '\vI\-'
syn match warn   '\vW\-'
syn match err    '\vE\-' nextgroup=atten skipwhite
syn match severe '\vS\-' nextgroup=atten skipwhite
syn match term   '\vT\-' nextgroup=atten skipwhite
syn region atten start='\v.' end='\v$' contains=dir,quote,seperator contained display

" Summary Statements
syn match elapsed_kw 'Elapsed Time' nextgroup=elapsed_op skipwhite
syn match elapsed_op '\v:|\='       nextgroup=elapsed_time skipwhite contained display
syn match elapsed_time '\v\d{2}:\d{2}:\d{2}' contained display

" Return Codes
syn keyword rc_kw RC          nextgroup=rc_op skipwhite
syn match rc_kw 'Return Code' nextgroup=rc_op skipwhite
syn match rc_kw 'Return code' nextgroup=rc_op skipwhite
syn match rc_op '\v:|\='      nextgroup=rc_num skipwhite contained display
syn match rc_num '\v\d+'      contained display

" ---- Linking ----

" Misc
hi def link dir          Type
hi def link quote        String
hi def link list         Operator
hi def link log_opers    Operator
hi def link log_eq    Operator
hi def link functionName Comment

" Log Variables and Values
hi def link log_var  Identifier
hi def link log_val  String

" Message Levels
hi def link info   Statement
hi def link warn   Statement 
hi def link err    Statement
hi def link severe Statement
hi def link term   Statement
hi def link atten  Number

" Summary Statements
hi def link elapsed_kw   Identifier
hi def link elapsed_op   Operator
hi def link elapsed_time Constant

hi def link rc_kw        Identifier
hi def link rc_op        Operator
hi def link rc_num       Constant
