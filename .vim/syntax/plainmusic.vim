if exists("b:current_syntax")
  finish
endif

" ---- Group Creation ----------------------------------------------------------

" ---- Misc ----
syn match pmComment '\v\#[^\n]*'
syn match pmDigit '\v<[[:digit:]]+>'

" ---- Instructions ----
syn region pmCommandBlock start='\[' end='\]' transparent
  \ contains=
  \   pmDigit,
  \   pmCommand

syn match pmCommand '\v[-[:alnum:]]+(:)@=' contained display

" ---- Staves ----
syn region pmStave start='{' end='}' fold transparent
  \ contains=
  \   pmComment,
  \   pmDigit,
  \   pmInstruction,
  \   pmBar,
  \   pmPitch,
  \   pmAccidental,
  \   pmRest,
  \   pmOctave,
  \   pmDuration,
  \   pmArticulation,
  \   pmGrouping,
  \   pmChord

" ---- Misc
syn region pmInstruction start="'" end="'" contained
syn match  pmBar '|' contained

" ---- Note Values
syn match  pmPitch '[abcdefg]' contained
syn match  pmAccidental '[sl]' contained
syn match  pmRest 'r' contained

" ---- Modifiers
syn match  pmOctave '_\^' contained
syn match  pmDuration '[+\-\.]' contained
syn match  pmArticulation '[~!*]' contained

" ---- Grouping
syn region pmGrouping start='(' end=')' contained fold transparent
syn region pmChord start='<' end='>' contained fold transparent

" ---- Linking -----------------------------------------------------------------

" ---- Misc ----
hi def link pmComment      Comment
hi def link pmDigit        Constant

" ---- Commands ----
hi def link pmCommand      Statement

" ---- Staves ----
hi def link pmInstruction  String
hi def link pmBar          Comment

" ---- Notes
hi def link pmPitch        Type
hi def link pmAccidental   Type
hi def link pmRest         Type

" ---- Modifiers
hi def link pmOctave       Operator
hi def link pmDuration     Operator
hi def link pmArticulation Operator
