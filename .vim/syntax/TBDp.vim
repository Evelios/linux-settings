" Syntax file for TBDpat files. The formated vector files of TBDbin

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = 'TBDpatt'


" ---- Matching Blocks ----

syn match patcomment '\v#.*'
syn match bitstring  '\v^[01xZ\.]+;?$'
syn region doubleQuote start='\v"' end='\v"'

syn keyword basicKeywords    Experiment Test_Section Tester_Loop nextgroup=odometer skipwhite
syn keyword basicKeywords    Test_Procedure Test_Sequence Pattern nextgroup=odometer skipwhite
syn keyword eventKeyword     Event nextgroup=eventOdometer
syn keyword defineKeyword    Define_Sequence nextgroup=variableName skipwhite
syn keyword keyDataKeyword   Keyed_Data
syn keyword registerKeyword  Stim_Register Measure_Register nextgroup=functionBlock skipwhite

syn match odometer      '\v [0-9]{,2}\.[0-9\.]*' nextgroup=functionBlock skipwhite contained display
syn match eventOdometer '\v [0-9]{,2}\.[0-9\.]*' nextgroup=eventCall skipwhite contained display
syn match eventCall     '\v\w+' nextgroup=functionBlock skipwhite contained display

" Functional Block : Handle (blocks=value, variable=val2) style
syn region functionBlock start='(' end=')' contains=variableName contained display
syn match  variableName  '\v\w+' nextgroup=equalsSign skipwhite contained display
syn match  equalsSign    '\v\='  nextgroup=value,doubleQuote skipwhite contained display
syn match  value         '\v\w+' contained display


" ---- Linking ----

hi link patcomment      Comment
hi link bitstring       Comment
hi link doubleQuote     String

hi link basicKeywords   Statement
hi link eventKeyword    Statement

hi link eventCall       Function
hi link defineKeyword   Function
hi link keyDataKeyword  Function
hi link registerKeyword Function

hi link value           Number
hi link odometer        Number
hi link eventOdometer   Number

" Functional Block
hi link variableName    Identifier
hi link equalsSign      Operator
