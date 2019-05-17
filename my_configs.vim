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
au FileType sh setl foldmethod=indent

" Makefile
au FileType make setl foldmethod=indent
au FileType make setl shiftwidth=4

" Protobuf
" TODO vim can parse proto. find better solution, e.g. change syntax itself
au FileType proto setl syntax=cpp
au BufRead *.pbtxt setl syntax=cpp

" *.bzl
au BufRead *.bzl setl foldmethod=indent

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
