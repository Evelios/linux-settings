if exists("b:current_syntax")
  finish
endif

" ---- Syntax Declerations ----

" Comments
syn region  blockComment      start='\v/\*' end='\v\*/' contains=sectionStart
syn match   singleLineComment '\v//.*$' " C style comments
"syn keyword sectionStart      SECTION skipwhite 
syn keyword sectionStart      SECTION nextgroup=sectionName skipwhite 
syn keyword sectionEnd        END_SECTION
syn match   sectionName       '\v<\w*>' contained display

" Misc
syn region singleQuote start=/\v'/ skip=/\v\\./ end=/\v'/
syn region doubleQuote start=/\v"/ skip=/\v\\./ end=/\v"/
syn match  symbols     '\v:|,|\*|;'
syn match  digits      '\v<[0-9]+(\.[0-9]+)?>'
"syn match dir       '\v\/[[:alnum:]]+\/[[:alnum:]_@\/\-\.]+'

" ---- Linking ----

" Misc
"hi def link dir       Type
hi def link blockComment      Comment
hi def link singleLineComment Comment
hi def link signleQuote       String
hi def link doubleQuote       String
hi def link symbols           Operator
hi def link sectionStart      Statement
hi def link sectionEnd        Statement
hi def link sectionName       Identifier
hi def link digits            Number
