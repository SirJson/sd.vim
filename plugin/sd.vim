"""
" sd.vim
"
" Provides more familiar replace and substitute commands with the help of sd
"
" Example
"
" > sed is easy
" :RegexReplace sed(\ .*) sd$1
" > sd is easy
"
"""


function! sd#use_literal(sfind, sreplace)
    let l:find = shellescape(expand(a:sfind))
    let l:replace = shellescape(expand(a:sreplace))
    execute '% !sd --string-mode '.l:find.' '.l:replace
endfunction

function! sd#use_regex(sfind, sreplace,...)
    let l:find = shellescape(expand(a:sfind))
    let l:replace = shellescape(expand(a:sreplace))
    let l:flagsopt = get(a:000, 2, '')
    if a:0 > 0
        let l:flags = "-f ". a:1
        let l:cmdline = l:flags.' '.l:find.' '.l:replace
        execute '% !sd '.l:cmdline
    else
        execute '% !sd '.l:find.' '.l:replace
    endif
endfunction


command! -nargs=+ -complete=command RegexReplace call sd#use_regex(<f-args>)
command! -nargs=+ -complete=command SimpleReplace call sd#use_regex(<f-args>)
