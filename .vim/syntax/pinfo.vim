if exists("b:current_syntax")
  finish
endif

syn region  pinfoString     start='\v"'   end='\v"'
syn region  pinfoComment    start='\v/\*' end='\v\*/'

syn keyword pinfoStatement StartSection EndSection  nextgroup=pinfoSection skipwhite
syn keyword pinfoBlock     Macro Header TVSense Hbmphy  nextgroup=pinfoSection skipwhite
syn match   pinfoBlock     '\v\cStart\w*' nextgroup=pinfoSection skipwhite
syn match   pinfoBlock     '\v\cEnd\w*'   nextgroup=pinfoSection skipwhite
syn match   pinfoSection    '\v\w+' contained display

syn match   pinfoIdentifier '\v\w+(\s*\=)@='

syn match   pinfoOperator   '\v\=|\,|\;|\:'
syn match   pinfoNumeric    '\<-\=\d\d*\.\=\d*\>'

hi def link pinfoString     String
hi def link pinfoComment    Comment
hi def link pinfoStatement  Statement
hi def link pinfoSection    Typedef
hi def link pinfoBlock      Structure
hi def link pinfoOperator   Operator
hi def link pinfoIdentifier Identifier
hi def link pinfoNumeric    Numeric
