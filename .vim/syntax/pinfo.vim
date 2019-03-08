if exists("b:current_syntax")
  finish
endif

syn region  pinfoString     start='\v"'   end='\v"'
syn region  pinfoComment    start='\v/\*' end='\v\*/'

syn keyword pinfoStatement  StartSection EndSection Macro nextgroup=pinfoSection skipwhite
syn match   pinfoSection    '\v\w+' contained display

syn match   pinfoOperator   '\v\=|\,|\;|\:'
syn match   pinfoIdentifier '\v(^\s*|,\s*)\w+'
syn match   pinfoNumeric    '\v\<\-?\d+\.?\d*\>'

hi def link pinfoString     String
hi def link pinfoComment    Comment
hi def link pinfoStatement  Statement
hi def link pinfoSection    Typedef
hi def link pinfoOperator   Operator
hi def link pinfoIdentifier Identifier
hi def link pinfoNumeric    Numeric
