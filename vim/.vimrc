" activates filetype detection
filetype plugin on

" allows you to deal with multiple unsaved buffers simultaneously
" without resorting to misusing tabs
set hidden

" syntax highlighting
syntax on
set background=dark
colorscheme PaperColor

" set tab to use spaces, and some auto indenting stuff
set autoindent
set smartindent
set expandtab
set tabstop=3
set shiftwidth=3

" activate line numbers
set number

" absolutely necessary. Try using it without!
" from Romainl on stackoverflow
set backspace=indent,eol,start

" turn off line wrapping
set nowrap

" display visual characters for special things
set list lcs=trail:·,tab:»·,extends:>,precedes:<

" go to the position I was when last editing the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
