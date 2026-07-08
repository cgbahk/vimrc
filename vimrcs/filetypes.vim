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

autocmd FileType javascript setlocal tabstop=2 shiftwidth=2


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
autocmd FileType python setl foldmethod=indent
" To be aligned with `ruff`
autocmd FileType python setl colorcolumn=88

autocmd FileType cmake setl foldmethod=indent

autocmd BufRead *.fbs setl syntax=cpp

autocmd FileType sh setl foldmethod=marker
autocmd FileType sh setl foldmarker={,}

autocmd FileType make setl foldmethod=indent
autocmd FileType make setl shiftwidth=4

autocmd FileType proto setl foldmethod=marker
autocmd FileType proto setl foldmarker={,}

autocmd BufRead *.pbtxt setl syntax=java
autocmd BufRead *.pbtxt setl foldmethod=marker
autocmd BufRead *.pbtxt setl foldmarker={,}

autocmd BufRead *.bzl setl foldmethod=indent
autocmd BufRead *.BUILD setl syntax=bzl
autocmd BufRead BUILD.* setl syntax=bzl

autocmd FileType yaml setl foldmethod=indent

autocmd BufRead *.jinja setl syntax=yaml
autocmd BufRead *.jinja setl foldmethod=indent

autocmd FileType go setl tabstop=2
autocmd FileType go let &l:shiftwidth=&l:tabstop
augroup RollbackIsKeywordForGolang
  " Keymap K (LSP hover) for golang does `iskeyword+=.`
  " This is to revert the behavior, but you should `:edit`
  autocmd!
  autocmd FileType go setlocal iskeyword-=.
  autocmd BufWrite *.go setlocal iskeyword-=.
augroup END

autocmd FileType groovy setl foldmethod=marker
autocmd FileType groovy setl foldmarker={,}

autocmd BufRead Jenkinsfile setl syntax=groovy
autocmd BufRead Jenkinsfile setl foldmethod=marker
autocmd BufRead Jenkinsfile setl foldmarker={,}

autocmd FileType xml setl foldmethod=indent

autocmd BufRead *.swift setl syntax=javascript
autocmd BufRead *.swift setl foldmethod=marker
autocmd BufRead *.swift setl foldmarker={,}

" git ISSUE_EDITMSG (for `hub` executable)
autocmd BufRead ISSUE_EDITMSG setl syntax=markdown
autocmd BufRead ISSUE_EDITMSG setl filetype=markdown
autocmd BufRead ISSUE_EDITMSG setl foldmethod=syntax
autocmd BufRead ISSUE_EDITMSG setl textwidth=500

autocmd FileType dot setl foldmethod=marker
autocmd FileType dot setl foldmarker={,}

autocmd FileType tex setlocal foldmethod=indent

" Rocq
autocmd BufRead,BufNewFile *.v setfiletype ocaml

autocmd FileType html setlocal iskeyword+=-
autocmd BufRead,BufNewFile *.html setlocal foldmethod=indent

" rust
lua <<EOF
vim.lsp.config('rust_analyzer', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    -- Climb parents looking for Cargo.toml or rust-project.json
    local cargo_root = vim.fs.root(fname, { 'Cargo.toml', 'rust-project.json' })
    on_dir(cargo_root)
  end,
})
EOF

autocmd FileType rust lua vim.lsp.enable('rust_analyzer')
