" Perl highlight perl function call

" syn match perlFunName "\w\+\s*(\@="

" Perl Function Parameters module
syn match perlFunction +\<fun\>\_s*+ nextgroup=perlFunName
syn match perlFunName +\%(\h\|::\|'\w\)\%(\w\|::\|'\w\)*\_s*\|+ contained

hi def link perlFunName Function

" Perl Types Standard Module
syn keyword perlStatementType Any Item Bool Maybe Undef Defined Value Str Num Int
syn keyword perlStatementType Ref ScalarRef ArrayRef HashRef CodeRef RegexpRef GlobRef FileHandle Object

" Try::Tiny module for error handling
syn keyword perlStatementType try catch

hi def link perlStatementType perlStatement

" ---- Perl Concealment Characters ----

if !has('conceal') || &diff
    finish
endif

" Bitwise Operators
syntax match perlNiceOperator '&&' conceal cchar=∧
syntax match perlNiceOperator '||' conceal cchar=∨

" Statement & Looping Operations
syntax keyword perlStatement if conceal cchar=⇨
syntax keyword perlStatement else conceal cchar=⇰
syntax keyword perlStatement return conceal cchar=⏎
syntax keyword perlStatement break conceal cchar=↴
syntax keyword perlStatement continue conceal cchar=↰
syntax keyword perlStatement goto conceal cchar=↷
syntax keyword perlStatement while conceal cchar=↻
syntax keyword perlStatement for conceal cchar=∀
syntax keyword perlStatement switch conceal cchar=⇋
syntax keyword perlStatement case conceal cchar=⇁
syntax keyword perlStatement default conceal cchar=⇉

" Misc
syntax match perlConcealOp '->' conceal cchar=→
syntax match perlConcealFade ';$' conceal cchar=˛
" syntax match cppConcealOp '::' conceal cchar=
syntax match perlLambda +\(=>\?\s*\)\@<=sub\(\W\)\@=+ conceal cchar=λ

hi! link perlConcealOp Operator
hi! link Conceal       Operator
