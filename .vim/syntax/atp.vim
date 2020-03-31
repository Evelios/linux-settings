" Syntax file for atp files. Teradyne ultraflex automated tester patterns

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = 'atp'

" ---- Matching ----

" ---- Main Identifiers
syn keyword atpKeyword halt scan scan_setup si so start_label repeat
syn keyword atpKeyword global if return jump
syn keyword atpKeyword vm_vector srm_vector
syn keyword atpKeyword set_cpu_cond

" ---- Import Statments
syn match atpImportStatement 'import tset' nextgroup=atpImport skipwhite
syn match atpImport '\v\h\w*' nextgroup=atpImportComma contained display skipwhite
syn match atpImportComma ',' nextgroup=atpImport contained display skipwhite

" ---- Variables
syn match atpVariable '\v^\h\w*(\s*\=)@=' nextgroup=atpVariableEquals skipwhite
syn match atpVariableEquals '=' nextgroup=atpValue skipwhite contained display
syn match atpValue '\v\h\w*' contained display

" ---- Misc
syn match atpComment "\v//.*$"
syn match atpOperator "\v(\=|;|,|\>)"

" ---- Linking ----
hi def link atpKeyword Keyword

hi def link atpImportStatement Include
hi def link atpImport Type
hi def link atpVariable Identifier
hi def link atpValue String

hi def link atpComment Comment
hi def link atpOperator Operator
hi def link atpImportComma Operator
hi def link atpVariableEquals Operator
