"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256

" let ale using compile_commands.json
let g:ale_c_parse_compile_commands = 1

" No fold view on opening buffer
au BufReadPre * :se foldlevel=99
" Keep fold view
set foldlevelstart=-1

" set default foldmethod
set foldmethod=syntax

let g:bufExplorerSortBy='mru'

nnoremap <silent> * :let @/ = '\<' . escape(expand('<cword>'), '\') . '\>'<CR>:se hls<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype specific configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python
au FileType python setl foldmethod=indent

" cmake
au FileType cmake setl foldmethod=indent

" flatbuffers
" TODO apply proper setting for flatbuffers
au BufRead *.fbs setl syntax=cpp

" sh
au FileType sh setl foldmethod=marker
au FileType sh setl foldmarker={,}

" Makefile
au FileType make setl foldmethod=indent
au FileType make setl shiftwidth=4

" Protobuf schema
au FileType proto setl foldmethod=marker
au FileType proto setl foldmarker={,}

" Protobuf text
au BufRead *.pbtxt setl syntax=java
au BufRead *.pbtxt setl foldmethod=marker
au BufRead *.pbtxt setl foldmarker={,}


" *.bzl
au BufRead *.bzl setl foldmethod=indent

" yaml
au FileType yaml setl foldmethod=indent

" jinja
au BufRead *.jinja setl syntax=yaml
au BufRead *.jinja setl foldmethod=indent

" go
au FileType go setl tabstop=2
au FileType go let &l:shiftwidth=&l:tabstop

" groovy
au FileType groovy setl foldmethod=marker
au FileType groovy setl foldmarker={,}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enhance fold view
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FoldText()
  " Description: Folding configuration

  " TODO ALE indication column is not counted
  let winwidth = winwidth(0)
        \ - &fdc
        \ - &number*&numberwidth
        \ - (&l:signcolumn is# 'yes' ? 2 : 0)

  let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
  let foldinfo = "   ( " . string(foldlinecount) . " lines )   "

  let tabreplace = repeat(" ", &tabstop)
  let foldstartline = substitute(getline(v:foldstart), '[\t]', tabreplace, 'g')

  if &foldmethod == "indent"
    let foldsummary = foldstartline . "..."
  else
    let foldendline = substitute(getline(v:foldend), '^\s*\(.\{-}\)\s*$', '\1', '')
    let foldsummary = foldstartline . "..." . foldendline
  endif
  let cuttedsummary = strpart(foldsummary, 0 , winwidth - len(foldinfo))

  let fillcharcount = winwidth - len(cuttedsummary) - len(foldinfo)

  return cuttedsummary . repeat(" ",fillcharcount) . foldinfo
endfunction
set foldtext=FoldText()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Call local configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
source ~/.vim_runtime/my_configs_local.vim
catch
endtry
