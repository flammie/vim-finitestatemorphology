" Vim syntax file
" Language:	XFST debug tool syntax
" Maintainer:	Flammie A Pirinen <falmmie@helsinki.fi>
" Last Change:	Fri, 15 Jan 2021 06:04:53 +0100
" URL: https://github.com/flammie/vim-finitestatemorphology
"
" Stolen from php.vim
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'xfst'
endif

syn sync clear

syn case match

" Internal keywords
syn keyword	xfstKeyWords	define read regex echo exit die hyvästi

" Operator
syn match	xfstOper	/[|&!?*#+^;_"@]/	display
syn match	xfstOper	/=>\|<=\|<\=>\|=\|->\|.o.\|.x.\|(->)/	display
syn region	xfstRegex	start=/define [a-zA-Z]*/	end=/;/	contains=xfstChar,xfstPair,xfstEscapee,xfstOper
syn region	xfstRegex	start=/read regex/	end=/;/	contains=xfstChar,xfstPair,xfstEscapee,xfstOper
syn region	xfstBraces	start=/[({]/	end=/[})]/	contains=xfstChar,xfstPair,xfstEscapee,xfstOper
syn match	xfstPair	/[^: ]\+:[^: ]\+/	display
syn match	xfstPair	/[^: ]\+: /	display
syn match	xfstPair	/ :[^: ]\+/	display
syn match	xfstChar	/[A-Za-z]\+/	contained

" SpecialChar
syn match xfstEscapee	/%[+%^]/	display

" Comments
syn keyword	xfstCommentNotes	TODO FIXME XXX	contained
syn match	xfstCommentInfos	/@\w\+/	contained
syn match	xfstComment	/!.*/	contains=xfstCommentNotes,xfstCommentInfos

" Clusters, regions...

" Highlights
highlight def link	xfstKeyWords	Keyword
highlight def link	xfstEscapee	Character
highlight def link	xfstRegex	Identifier
highlight def link	xfstOper	Operator
highlight def link	xfstChar	Character
highlight def link	xfstPair	Character
highlight def link	xfstCommentInfos	SpecialComment
highlight def link	xfstCommentNotes	Todo
highlight def link	xfstComment	Comment

let b:current_syntax = "xfst"

if main_syntax == 'xfst'
  unlet main_syntax
endif

" vim: ts=8
