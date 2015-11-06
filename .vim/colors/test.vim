" Vim color file
"
" Author: John Wright <jcwr@cypress.com>
"

hi clear

set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="test"


