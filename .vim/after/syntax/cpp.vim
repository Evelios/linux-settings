if !has('conceal') || &diff
    finish
endif

" setlocal conceallevel=1

" Boolean Operations
syntax match cppConcealOp '==' conceal cchar=≡
syntax match cppConcealOp '!=' conceal cchar=≠
syntax match cppConcealOp '<=' conceal cchar=≤
syntax match cppConcealOp '>=' conceal cchar=≥
syntax match cppConcealOp '<<' conceal cchar=«
syntax match cppConcealOp '>>' conceal cchar=»

" Math Operations
syntax match cppConcealOp '--' conceal cchar=▼
syntax match cppConcealOp '++' conceal cchar=▲

" Bitwise Operators
syntax match cNiceOperator '&&' conceal cchar=∧
syntax match cNiceOperator '||' conceal cchar=∨
syntax match cNiceOperator '<<' conceal cchar=≺
syntax match cNiceOperator '>>' conceal cchar=≻

" Keyword Matches
" syntax keyword cType void conceal cchar=∅
" syntax keyword cType unsigned conceal cchar=ℕ
" syntax keyword cType int short char LONG SHORT conceal cchar=ℤ
" syntax keyword cType float double conceal cchar=ℝ
" syntax keyword cType STR string conceal cchar=S
" syntax keyword cType STRING conceal cchar=C
" syntax keyword cType BOOLEAN conceal cchar=B
" syntax keyword cType TRUE true conceal cchar=⊤
" syntax keyword cType FALSE false conceal cchar=⊥
" bool = 𝔹

" Class Type Declerations
" syntax keyword cStructure enum conceal cchar=∈
" syntax keyword cStructure union conceal cchar=⋃
" syntax keyword cStructure struct conceal cchar=⊇
" syntax keyword cOperator sizeof conceal cchar=𝔠

" Statement & Looping Operations
syntax keyword cStatement if conceal cchar=▶
syntax match cStatement 'else if' conceal cchar=▰
syntax keyword cStatement else conceal cchar=■
syntax keyword cStatement return conceal cchar=⏎
syntax keyword cStatement break conceal cchar=↴
syntax keyword cStatement continue conceal cchar=↰
syntax keyword cStatement goto conceal cchar=↷
syntax keyword cStatement while conceal cchar=↻
syntax keyword cStatement for conceal cchar=∀
syntax keyword cStatement switch conceal cchar=⇋
syntax keyword cStatement case conceal cchar=⇁
syntax keyword cStatement default conceal cchar=⇉

" Misc
syntax match cppConcealOp '->' conceal cchar=→
syntax match cppConcealFade ';' conceal cchar=˛
" syntax match cppConcealOp '::' conceal cchar=

hi! link cppConcealOp   Operator
hi! link Conceal        Operator
