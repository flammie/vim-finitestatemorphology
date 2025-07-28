" Vim syntax file
" Language:     Constraint Grammar stream format for text
" Maintainer:   Flammie Pirinen <flammie@iki.fi>
" Last Change:  2025-07-23T15:02:22+0100
" URL: http://iki.fi/~flammie
"
" Stolen from php.vim
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'cg3text'
endif

syn sync clear

syn case match

" Internal keywords
syn keyword     vislcg3KeyWords         ADD ADDCOHORT ADDRELATION ADDRELATIONS APPEND COPY IFF MAP REMCOHORT REMOVE REMRELATION REMRELATIONS REPLACE SELECT SETCHILD SETPARENT SETRELATION SETRELATIONS SUBSTITUTE UNMAP
" Comments
syn match       vislcg3Comment     /^:.*$/

" Clusters, regions...
syn match       vislcg3Form             /^"<[^>]*>"/
syn match       vislcg3Word             /^\t\+"[^"]\+"/
syn match       vislcg3Analysis         / [A-Za-z]\+/
syn match       vislcg3Trace            /^;.*$/

" Highlights
highlight def link      vislcg3KeyWords Keyword
highlight def link      vislcg3Form String
highlight def link      vislcg3Word        Character
highlight def link      vislcg3Comment  Comment
highlight def link      vislcg3Trace    Comment
highlight def link      vislcg3Analysis         Identifier

let b:current_syntax = "cg3text"

if main_syntax == 'cg3text'
  unlet main_syntax
endif

" vim: ts=8
