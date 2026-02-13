""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f # --- <esc>a


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript,typescript imap <C-t> console.log();<esc>hi
au FileType javascript,typescript imap <C-a> alert();<esc>hi

au FileType javascript,typescript inoremap <buffer> $r return 
au FileType javascript,typescript inoremap <buffer> $f // --- PH<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
endfunction


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif


""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html


""""""""""""""""""""""""""""""
" => My custom
""""""""""""""""""""""""""""""
au FileType python setl foldmethod=indent
au FileType python setl colorcolumn=100

au FileType cmake setl foldmethod=indent

au BufRead *.fbs setl syntax=cpp

au FileType sh setl foldmethod=marker
au FileType sh setl foldmarker={,}

au FileType make setl foldmethod=indent
au FileType make setl shiftwidth=4

au FileType proto setl foldmethod=marker
au FileType proto setl foldmarker={,}

au BufRead *.pbtxt setl syntax=java
au BufRead *.pbtxt setl foldmethod=marker
au BufRead *.pbtxt setl foldmarker={,}

au BufRead *.bzl setl foldmethod=indent
au BufRead *.BUILD setl syntax=bzl
au BufRead BUILD.* setl syntax=bzl

au FileType yaml setl foldmethod=indent

au BufRead *.jinja setl syntax=yaml
au BufRead *.jinja setl foldmethod=indent

au FileType go setl tabstop=2
au FileType go let &l:shiftwidth=&l:tabstop

au FileType groovy setl foldmethod=marker
au FileType groovy setl foldmarker={,}

au BufRead Jenkinsfile setl syntax=groovy
au BufRead Jenkinsfile setl foldmethod=marker
au BufRead Jenkinsfile setl foldmarker={,}

au FileType xml setl foldmethod=indent

au BufRead *.swift setl syntax=javascript
au BufRead *.swift setl foldmethod=marker
au BufRead *.swift setl foldmarker={,}

" git ISSUE_EDITMSG (for `hub` executable)
au BufRead ISSUE_EDITMSG setl syntax=markdown
au BufRead ISSUE_EDITMSG setl filetype=markdown
au BufRead ISSUE_EDITMSG setl foldmethod=syntax
au BufRead ISSUE_EDITMSG setl textwidth=500

au FileType dot setl foldmethod=marker
au FileType dot setl foldmarker={,}

au FileType tex setlocal foldmethod=indent
