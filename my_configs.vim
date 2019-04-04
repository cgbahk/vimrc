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

try
source ~/.vim_runtime/my_configs_local.vim
catch
endtry
