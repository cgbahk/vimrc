set t_Co=256

" let ale using compile_commands.json
let g:ale_c_parse_compile_commands = 1

" No fold view on opening buffer
set foldlevelstart=99

" set default foldmethod
set foldmethod=syntax

let g:bufExplorerSortBy='mru'

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

" Protobuf
" TODO vim can parse proto. find better solution, e.g. change syntax itself
au FileType proto setl syntax=cpp
au BufRead *.pbtxt setl syntax=cpp


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

  if &foldmethod == "indent"
    let foldsummary = getline(v:foldstart) . "..."
  else
    " TODO remove starting whitespaces
    let foldsummary = getline(v:foldstart) . "..." . getline(v:foldend)
  endif
  let cuttedsummary = strpart(foldsummary, 0 , winwidth - len(foldinfo))

  let fillcharcount = winwidth - len(cuttedsummary) - len(foldinfo)

  return cuttedsummary . repeat(" ",fillcharcount) . foldinfo
endfunction
set foldtext=FoldText()

try
source ~/.vim_runtime/my_configs_local.vim
catch
endtry
