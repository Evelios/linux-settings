" ---- Syntactic Highlighting ----
syntax match pythonOperator '='
syntax match pythonOperator '+'
syntax match pythonOperator '-'
syntax match pythonOperator '/'
syntax match pythonOperator '*'
syntax match pythonOperator ','
syntax match pythonOperator '\.'

syntax match pythonUnderscore '_'

hi def link pythonUnderscore Comment

" ---- Operator Concealing ----

" Operators

" Math Symbols
syntax match pythonConceal 'math\.pi' conceal cchar=π
syntax match pythonConceal '\v<pi>' conceal cchar=π

" Common Verbage
syntax match pythonConceal 'arc' conceal cchar=⋖
syntax match pythonConceal 'angle' conceal cchar=∡
syntax match pythonConceal 'circle' conceal cchar=◯

hi! link conceal Macro
