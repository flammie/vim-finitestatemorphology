" Author: Flammie <flammie@iki.fi>
" Description: validate vislcg3 files

call ale#Set('vislcg3_vislcg3_executable', 'vislcg3')
call ale#Set('vislcg3_vislcg3_options', '--grammar-only')

function! ale_linters#vislcg3#vislcg3#GetExecutable(buffer) abort
    return ale#Var(a:buffer, 'vislcg3_vislcg3_executable')
endfunction

function! ale_linters#vislcg3#vislcg3#GetCommand(buffer) abort
    let l:executable = ale_linters#vislcg3#vislcg3#GetExecutable(a:buffer)

    let l:command = l:executable .
        \ ale#Pad(ale#Var(a:buffer, 'vislcg3_vislcg3_options')) .
        \ ' --grammar %t'
    return l:command 
endfunction

function! ale_linters#vislcg3#vislcg3#Handle(buffer, lines) abort
    let l:output = []
    let l:pattern = '\v([^:]*): (Warning|Error): (.*) on line (\d+)'

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        call add(l:output, {
        \   'lnum': l:match[1] + 0,
        \   'text': l:match[3],
        \   'type': l:match[2][0],
        \})
    endfor

    return l:output
endfunction

call ale#linter#Define('vislcg3', {
\   'name': 'vislcg3_vislcg3',
\   'executable': function('ale_linters#vislcg3#vislcg3#GetExecutable'),
\   'command': function('ale_linters#vislcg3#vislcg3#GetCommand'),
\   'output_stream': 'stderr',
\   'callback': 'ale_linters#vislcg3#vislcg3#Handle',
\   'lint_file': 1,
\})
