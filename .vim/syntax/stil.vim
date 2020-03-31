" Syntax hilighting for the stil fail data

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = 'stil'

" Generics
syn region stilDoubleQuote start='\v"' end='\v"'
syn region stilSingleQuote start="\v'" end="\v'"
syn region stilTickQuote   start='\v`' end="\v`"
syn match  stilNumeric '\v<[+-]?[0-9][0-9\.]*>'
syn match  stilComment '\v//.*$'
syn region stilComment start='/\*' end='\*/'

syn keyword stilConstant
  \ In
  \ Out
  \ InOut
  \ Supply
  \ Pseudo
  \ TerminateHigh
  \ TerminateLow
  \ TerminateOff
  \ TerminateUnknown
  \ U D Z
  \ ForceUp
  \ ForceDown
  \ ForceOff
  \ Hex
  \ Dec
  \ MSB
  \ LSB

" Stil Specific
syn keyword stilHeader STIL nextgroup=stilNumeric

syn keyword stilSection
  \ STIL
  \ Header
  \ Signals
  \ SignalGroups
  \ Spec
  \ Category
  \ Selector
  \ Timing
  \ WaveformTable
  \ Pattern
  \ PatternBurst
  \ PatternExec
  \ Include
  \ Ann
  \ UserKeywords
  \ UserFunctions
  \ nextgroup=stilBlockName skipwhite

syn match   stilBlockName '\v\w(\w|-)+' contained display

syn keyword stilSpecName Min Typ Max Meas

"syn region stilBlock start='{' end='}' fold transparent

" Generics
hi link stilNumeric           Number
hi link stilDoubleQuote       String
hi link stilSingleQuote       String
hi link stilTickQuote         String
hi link stilComment           Comment

" Stil Specific
hi link stilKeyword           Statement
hi link stilSection           Statement
hi link stilBlockName         Function
hi link stilSpecName          Type
hi link stilConstant          Type
