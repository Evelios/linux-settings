if exists("b:current_syntax")
  finish
endif

syn keyword odometer_kw   TestModes Experiments
syn keyword pattern_type  INIT SCAN FUNC MACRO EXTIO
syn match   numeric       '\v ([0-9]+|D|S|T|U|z|Y|N)(\s|\n)'
syn match   char          '\v (D|S|T|U|z|Y|N)(\s|\n)'
syn match   percent       '\v [0-9]+\.[0-9]+\%'
syn match   odometer      '\v [0-9]+(\.[0-9]+)+'
syn match   table_format  '\v\-|\+|\|'

hi def link odometer_kw   Keyword 
hi def link numeric       Number
hi def link char          Character
hi def link percent       String
hi def link odometer      Identifier
hi def link table_format  Comment
hi def link pattern_type  Type
