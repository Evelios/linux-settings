if exists("b:current_syntax")
  finish
endif

syn match combsInclude '\v#\w+'
syn match combsComment '\v//.*$'

syn match combsVariable '\v^\s*\w+' nextgroup=equals skipwhite
syn match combsVariable '\v\$\w+' nextgroup=equals skipwhite
syn match combsFunction '\v\w+(\()@='
syn match equals '=' nextgroup=value,strValue skipwhite
syn match semicolon ';'
syn match comma ','
syn match value '\v[\.\-_[:alnum:]]+' contained display
syn match value '\v\"[\.\-_[:alnum:][:space:]]+\"' contained display
syn match combsNumber '\v<[0-9]+>'
syn keyword combsKeyword NO YES X H Z I W S T

hi def link combsInclude  Include
hi def link combsComment  Comment
hi def link equals        Operator
hi def link semicolon     Operator
hi def link comma         Operator
hi def link combsVariable Identifier
hi def link combsFunction Identifier
hi def link value         Constant
hi def link combsNumber   Constant
hi def link combsKeyword  Constant
