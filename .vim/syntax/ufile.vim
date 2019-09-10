if exists("b:current_syntax")
  finish
endif

" ---- Group Creation ----

syn match ufileComment '\v\*\*.*$'
syn match ufileNumber '\v<-?\d+(\.\d+)?>'

syn keyword ufileKeyword Failed Passed

syn match ufileVariable '\v\w+\s*(\=)@='
syn match ufileModuleNum '\v^\d+'

syn match ufileOperator '='

" ---- Linking ----

hi def link ufileComment Comment
hi def link ufileNumber Constant

hi def link ufileKeyword Statement
hi def link ufileModuleNum Type
hi def link ufileVariable Identifier
hi def link ufileOperator Operator
