" This is the syntax for the preprosessor formated sifpat file

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = 'fsifpat'

" Opcode Matching Sequences
syn match  opcode     '\v^ [0-9]{2} [0-9]{10}'      nextgroup=opcodeLength skipwhite
syn match  opcode     '\v^ (91|92|93|94) [0-9]{10}' nextgroup=pinNum skipwhite
syn match  opcode     '\v^ 75 [0-9]{10}'            nextgroup=timingSet skipwhite
syn match  opcode     '\v^ 83 [0-9]{10}'
syn match  opcode_01  '\v^ 01 [0-9]{10}'
syn match  opcode_end '\v^ 5F [0-9]{10}'

" Values within opcodes
syn match  pinNum '\v[0-9]{4}' nextgroup=opcodeLength contained skipwhite
syn match  opcodeLength '\v[0-9]{4,8}'  contained display
syn match  stimPin '\v[0-9]+(\([01PXZHLpxzhl]\))@='
syn match  timingSet '\v\w+$' contained display

" Comments
syn region headerComment start='\v^-+$' end='\v^-+$'
syn region opcodeComment start='\v^ 70' end='\v(^ ([0-9]{2}))@='
syn match  opcodeComment '\v^ 71.*$' contains=odometer
syn match  opcodeComment '\v^ 72.*$'
syn match  opcodeComment '\v^ 73.*$' contains=directive

" Matches Within Comments
syn match  odometer '\v[0-9]+(\.[0-9]+){5}' contained display
syn match  directive '\v(\=|\s)@<=\w+$' contained display

" Syntax Linking
hi link timingSet       PreProc
hi link opcode_01       Identifier
hi link opcode_end      Identifier
hi link opcode          Keyword
hi link stimPin         Type
hi link pinNum          Type
hi link odometer        Constant
hi link directive       Identifier
hi link opcodeLength    Constant
hi link opcodeComment   Comment
hi link headerComment   Comment
