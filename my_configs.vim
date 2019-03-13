set shiftwidth=2
let g:gitgutter_enabled=1 " TODO Not sure this is applied
set t_Co=256

" No fold view on opening buffer
set foldlevelstart=99

" foldmethod by filetype
au FileType cpp setl foldmethod=syntax
