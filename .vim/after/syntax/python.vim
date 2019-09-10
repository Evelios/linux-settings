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

" Syntax Concealing
" syntax keyword pythonConceal def conceal cchar=∯
" syntax keyword pythonConceal for conceal cchar=∀
" syntax keyword pythonConceal in conceal cchar=∊

" Operators

" Math Symbols
syntax match pythonConceal 'math\.pi' conceal cchar=π
syntax match pythonConceal '\v<pi>' conceal cchar=π

" Common Verbage
syntax match wordConceal 'arc' conceal cchar=⋖
syntax match wordConceal 'angle' conceal cchar=∡
syntax match wordConceal 'circle' conceal cchar=◯

hi! link conceal Statement
