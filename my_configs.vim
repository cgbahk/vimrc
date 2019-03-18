set shiftwidth=2
let g:gitgutter_enabled=1 " TODO Not sure this is applied
set t_Co=256

" No fold view on opening buffer
set foldlevelstart=99

" foldmethod by filetype
au FileType cpp setl foldmethod=syntax
au FileType python setl foldmethod=indent
"TODO this is only walkaround, so find why shiftwidth set to 4 for python
au FileType python setl shiftwidth=2
au FileType cmake setl foldmethod=indent
"TODO apply proper setting for flatbuffers
au BufRead *.fbs setl syntax=cpp
au BufRead *.fbs setl foldmethod=syntax

try
source ~/.vim_runtime/my_configs_local.vim
catch
endtry