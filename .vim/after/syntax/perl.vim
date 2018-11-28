" Perl highlight perl function call

" syn match perlFunName "\w\+\s*(\@="

" Perl Function Parameters module
syn match perlFunction +\<fun\>\_s*+ nextgroup=perlFunName
syn match perlFunName +\%(\h\|::\|'\w\)\%(\w\|::\|'\w\)*\_s*\|+ contained

hi def link perlFunName Function

" Perl Types Standard Module
syn keyword perlStatementType Any Item Bool Maybe Undef Defined Value Str Num Int
syn keyword perlStatementType Ref ScalarRef ArrayRef HashRef CodeRef RegexpRef GlobRef FileHandle Object

hi def link perlStatementType perlStatement
