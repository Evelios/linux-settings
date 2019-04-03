if exists("b:current_syntax")
  finish
endif

" ---- Group Creation ----------------------------------------------------------

syn match   combsInclude '\v#\w+'
syn match   combsComment '\v//.*$'

syn keyword combsSystemBlock SYSTEM GET TPG TDI COMP EXEC PKG FTP nextgroup=combsBlockName skipwhite
syn match   combsBlockName '\v\w+' contained display

syn keyword combsPatset PATSET nextgroup=combsPatsetDef skipwhite
syn match   combsPatsetDef '\v\w+' contained display
syn match   combsFunction '\v\w+(\()@='

syn match   combsVariable '\v^\s*\$?\w+\s*(\=)@=' nextgroup=equals skipwhite
syn match   combsVariable '\v\$\{?\w+\}?'
syn match   combsEquals '=' nextgroup=value,strValue skipwhite
syn match   combsSemicolon ';'
syn match   combsComma ','
syn match   combsValue '\v[\.\-_[:alnum:]]+' contained display
syn match   combsValue '\v\"[\.\-_[:alnum:][:space:]]+\"' contained display
syn region  combsString start='\v"' end='\v"'
syn region  combsString start='\v\'' end='\v\''
syn match   combsNumber '\v<[0-9]+>'
syn keyword combsConstant TRUE FALSE Y YES N NO H L X Z I W S T


syn match   combsDirectory '\v(/[[:alnum:]_\@\-\.]+)+\/*'

" ---- Linking -----------------------------------------------------------------

hi def link combsInclude     Include
hi def link combsComment     Comment

hi def link combsSystemBlock Statement
hi def link combsBlockName   Function

hi def link combsPatset      Statement
hi def link combsPatsetDef   Function
hi def link combsFunction    Function

hi def link combsEquals      Operator
hi def link combsSemicolon   Operator
hi def link combsComma       Operator
hi def link combsVariable    Identifier
hi def link combsValue       Constant
hi def link combsNumber      Constant
hi def link combsConstant    Constant
hi def link combsString      String

hi def link combsDirectory   Special
