" set the default tab to insert 3 spaces
setlocal shiftwidth=4
setlocal tabstop=4
set expandtab

" activates filetype detection
filetype plugin on

" allows you to deal with multiple unsaved buffers simultaneously
" without resorting to misusing tabs
set hidden

" syntax highlighting
syntax on
set background=dark
colorscheme PaperColor

" enable auto and smart indentation
set autoindent
set smartindent

" activate line numbers
set number

" absolutely necessary. try using it without!
set backspace=indent,eol,start

" turn off line wrapping
set nowrap

" display visual characters for special things
set list lcs=trail:·,tab:»·,extends:>,precedes:<

" go to the position I was when last editing the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" prevent the cursor from going to the first or last three lines 
" when scrolling
set scrolloff=3

" highlight the 81st column in black to show where when a line
" becomes too long.
highlight ColorColumn ctermbg=black
set colorcolumn=81

" show the row and column number at the bottom
set ruler

" show current filename being edited in the window title bar
set title
