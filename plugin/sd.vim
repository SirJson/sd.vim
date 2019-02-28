"""
" sd.vim
" 5 lines of code to use sd from a vim buffer.
"
" Provides the command Sd
"
" Example
"
" > sed is easy
" :Sd 'sed(\ .*)' 'sd$1'
" > sd is easy
"
" Caveats
"
" 1. You are still using your shell. Single quote your input!
" 2. Spaces have to be escaped with backslash. That is because vim.
"""

function! Execsd(command)
    exe '% !sd '.a:command
endfunction

command! -nargs=1 -complete=command Sd call Execsd(<f-args>)
