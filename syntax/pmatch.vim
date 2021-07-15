" Vim syntax file
" Language:	Hfst Pmatch tool syntax
" Maintainer:	Flammie A Pirinen <flammie@iki.fi>
" Last Change:	Fri, 15 Jul 2021 06:04:53 +0100
" URL: https://github.com/flammie/vim-finitestatemorphology
"
" Stolen from php.vim
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'pmatch'
endif

syn sync clear

syn case match

" Internal keywords
syn keyword	pmatchKeyWords	define Define read regex echo exit die hyvästi set

" Operator
syn match	pmatchOper	/[|&!?*#+^;_"@]/	display
syn match	pmatchOper	/=>\|<=\|<\=>\|=\|->\|.o.\|.x.\|(->)/	display
syn region	pmatchRegex	start=/[dD]efine [a-zA-Z]*/	end=/;/	contains=pmatchFunc,pmatchPair,pmatchChar,pmatchComment,pmatchOper
syn region	pmatchRegex	start=/read regex/	end=/;/	contains=pmatchFunc,pmatchPair,pmatchChar,pmatchComment,pmatchOper
syn match       pmatchFunc      /[A-Za-z]*[(][^)]*[)]/   display
syn match       pmatchFunc      /@[A-Za-z]*"[^"]*"/   display
syn match	pmatchPair	/[^: ]\+:[^: ]\+/	display
syn match	pmatchPair	/[^: ]\+: /	display
syn match	pmatchPair	/ :[^: ]\+/	display
syn match	pmatchChar	/[A-Za-z]\+/	contained

" SpecialChar
syn match pmatchEscapee	/%[+%^]/	display

" Comments
syn keyword	pmatchCommentNotes	TODO FIXME XXX	contained
syn match	pmatchCommentInfos	/@\w\+/	contained
syn match	pmatchComment	/!.*/	contains=pmatchCommentNotes,pmatchCommentInfos

" Clusters, regions...

" Highlights
highlight def link	pmatchKeyWords	Keyword
highlight def link	pmatchEscapee	Character
highlight def link	pmatchOper	Operator
highlight def link	pmatchFunc	Function
highlight def link	pmatchCommentInfos	SpecialComment
highlight def link	pmatchCommentNotes	Todo
highlight def link	pmatchComment	Comment

let b:current_syntax = "pmatch"

if main_syntax == 'pmatch'
  unlet main_syntax
endif

" vim: ts=8
