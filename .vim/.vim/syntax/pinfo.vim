if exists("b:current_syntax")
  finish
endif

syn region Comment start='\v/\*' end='\v\*/'
syn keyword Statement StartSection Macro
syn match Operator '\v\=|\,|\;|\:'
syn match Identifier '\v(^\s*|,\s*)\w+'
syn match Numeric '\v\<\-?\d+\.?\d*\>'
