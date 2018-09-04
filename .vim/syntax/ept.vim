if exists("b:current_syntax")
  finish
endif

" ---- Syntax Declerations ----

" Comments
syn match  commentSymbols '\v(\||-|\+|<V>)'

" EPT Specific
syn match  pinState '\v<[xXyYtTdD]>'

" Misc
syn region singleQuote start=/\v'/ skip=/\v\\./ end=/\v'/
syn region doubleQuote start=/\v"/ skip=/\v\\./ end=/\v"/
syn match  symbols     '\v:|,|\*|;'
syn match  digits      '\v<[0-9]+(\.[0-9]+)?>'
"syn match dir       '\v\/[[:alnum:]]+\/[[:alnum:]_@\/\-\.]+'

" ---- Linking ----

hi def link commentSymbols    Comment
hi def link pinState          Type
hi def link signleQuote       String
hi def link doubleQuote       String
hi def link symbols           Operator
hi def link digits            Number
