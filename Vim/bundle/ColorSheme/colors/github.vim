" Vim color file
"
" Author: Anthony Carapetis <anthony.carapetis@gmail.com>
"
" Note: Based on github's syntax highlighting theme
"       Used Brian Mock's darkspectrum as a starting point/template
"       Thanks to Ryan Heath for an easy list of some of the colours:
"       http://rpheath.com/posts/356-github-theme-for-syntax-gem

hi clear

set background=light
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="github"
hi Normal	guifg=#000000	guibg=#e5e5e5	gui=NONE	ctermfg=black	ctermbg=grey	cterm=NONE
hi Cursor	guifg=#000000	guibg=#A0A0A0	gui=NONE	ctermfg=bg	ctermbg=fg	cterm=NONE
hi CursorIM	guifg=bg	guibg=fg	gui=NONE	ctermfg=bg	ctermbg=fg	cterm=NONE
" }}}

 hi CursorLine		guibg=#cccccc	gui=NONE		ctermbg=yellow	cterm=NONE
 hi CursorColumn		guibg=#cccccc	gui=NONE		ctermbg=yellow	cterm=NONE
" {{{ Diff
hi DiffAdd         guifg=#003300 guibg=#DDFFDD gui=none
hi DiffChange                    guibg=#ececec gui=none
hi DiffText        guifg=#000033 guibg=#DDDDFF gui=none
hi DiffDelete      guifg=#DDCCCC guibg=#FFDDDD gui=none
" }}}

" {{{ Folding / Line Numbering / Status Lines
hi Folded	guifg=#ffbcbc	guibg=#884040	gui=NONE	ctermfg=gray	ctermbg=darkred	cterm=NONE
hi FoldColumn	guifg=#af8c8c	guibg=#333333	gui=NONE	ctermfg=red	ctermbg=black	cterm=NONE
hi SignColumn	guifg=#ffffbc	guibg=#333333	gui=NONE	ctermfg=yellow	ctermbg=black	cterm=NONE

hi LineNr		guifg=#989898 guibg=#333333 gui=none
hi NonText		guifg=#808080 guibg=#ECECEC

hi VertSplit	guibg=#bbbbbb guifg=#bbbbbb gui=none
hi StatusLine   guibg=#bbbbbb guifg=#404040 gui=bold
hi StatusLineNC guibg=#d4d4d4 guifg=#404040 gui=italic
" }}}

" {{{ Misc
hi ModeMsg		guifg=#990000
hi MoreMsg		guifg=#990000

hi Title		guifg=#ef5939
hi WarningMsg	guifg=#ef5939
hi SpecialKey   guifg=#177F80 gui=bold

hi Underlined	guifg=#000000 gui=underline
hi Directory	guifg=#990000
" }}}

" {{{ Search, Visual, etc
hi Visual		guibg=#bfbfbf	gui=NONE	ctermfg=fg	ctermbg=yellow	cterm=NONE
hi VisualNOS		guibg=#bf9999	gui=NONE	ctermfg=fg	ctermbg=cyan	cterm=NONE
hi Search	guifg=fg	guibg=#e7a52e	gui=NONE	ctermfg=fg	ctermbg=brown	cterm=NONE
hi IncSearch	guifg=bg	guibg=fg	gui=NONE	ctermfg=bg	ctermbg=fg	cterm=NONE
" }}}

" {{{ Syntax groups
hi Ignore		guifg=#808080
hi Identifier	guifg=#0086B3
hi PreProc		guifg=#A0A0A0 gui=bold
hi Comment  guifg=#888888 ctermfg=59 guibg=NONE gui=italic
hi Constant		guifg=#177F80 gui=none
hi String		guifg=#D81745
hi Function		guifg=#990000 gui=bold
hi Statement	guifg=#884040 gui=bold,italic
hi Type			guifg=#445588 gui=bold
hi Number		guifg=#987800
hi Todo			guifg=#884040 guibg=#990000 gui=bold,italic
hi Special		guifg=#159828 gui=bold
hi rubySymbol   guifg=#960B73
hi Error        guibg=#884040 guifg=#ff1100 gui=undercurl,italic
hi Todo         guibg=#884040 guifg=#ff1100 gui=underline
hi Label        guifg=#884040 gui=bold,italic
hi StorageClass guifg=#884040 gui=bold,italic
hi Structure    guifg=#884040 gui=bold,italic
hi TypeDef      guifg=#884040 gui=bold,italic
" }}}

" {{{ Completion menus
hi WildMenu	guifg=#f8f8f8	guibg=#333333	gui=NONE	ctermfg=gray	ctermbg=fg	cterm=NONE
hi Pmenu	guibg=#cccccc	gui=underline		ctermbg=yellow	cterm=NONE
hi PmenuSel	guifg=#ffbcbc	guibg=#884040	gui=underline	ctermfg=gray	ctermbg=darkred	cterm=NONE
hi PmenuSbar	guifg=#333333	guibg=#333333	gui=NONE	ctermfg=darkgray	ctermbg=darkgray	cterm=NONE
hi PmenuThumb	guifg=#999999	guibg=#999999	gui=NONE	ctermfg=gray	ctermbg=gray	cterm=NONE

" }}}

" {{{ Spelling
hi spellBad     guisp=#ff4040
hi spellCap     guisp=#ff4040
hi spellRare    guisp=#ff4040
hi spellLocal   guisp=#ff4040
" }}}

" {{{ Aliases
hi link cppSTL          Function
hi link cppSTLType      Type
hi link Character		Number
hi link htmlTag			htmlEndTag
"hi link htmlTagName     htmlTag
hi link htmlLink		Underlined
hi link pythonFunction	Identifier
hi link Question		Type
hi link CursorIM		Cursor
hi link VisualNOS		Visual
hi link xmlTag			Identifier
hi link xmlTagName		Identifier
hi link shDeref			Identifier
hi link shVariable		Function
hi link rubySharpBang	Special
hi link perlSharpBang	Special
hi link schemeFunc      Statement
"hi link shSpecialVariables Constant
"hi link bashSpecialVariables Constant
" }}}

hi MatchParen	guibg=NONE guifg=#177f80 gui=bold,italic
hi IndentGuidesOdd  guifg=#884040 guibg=#e5e5e5   ctermbg=3 gui=underline 
hi IndentGuidesEven guifg=#177f80 guibg=#cccccc ctermbg=4 gui=underline
" {{{ Tabs (non-gui0
hi TabLine		guifg=#404040 guibg=#dddddd gui=underline
hi TabLineFill	guifg=#404040 guibg=#dddddd gui=underline
hi TabLineSel	guifg=#404040 gui=underline
" }}}
"
" vim: sw=4 ts=4 foldmethod=marker
