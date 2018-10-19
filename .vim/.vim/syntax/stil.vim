" Syntax hilighting for the stil fail data

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = 'stil'

syn keyword basicKeywords PatternFailReport Ann
syn region doubleQuote start='\v"' end='\v"'
syn region singleQuote start="\v'" end="\v'"

" Ann {* ... *} Blocks
syn region annBlock start='Ann {' end='}' fold transparent contains=patternKeyword,numeric
syn match numeric '\v[0-9][0-9\.]*'
syn keyword patternKeyword Pattern


hi link basicKeywords    Identifier
hi link patternKeyword   Statement
hi link annIdentifier    Statement
hi link numeric          Number
hi link doubleQuote      String
hi link singleQuote      String
