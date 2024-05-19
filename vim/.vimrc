" set the default tab to insert 3 spaces
set shiftwidth=4
set tabstop=4
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

" show the mode you are on in the last line
set showmode

" show maching words during a search
set showmatch

" menu tab completion:
"   1. enable auto completion menu after pressing TAB
"   2. make wildmenu behave similar to Bash completion
"   3. there are certain files that we would never want to edit with Vim
"      wildmenu will ignore files with these extensions
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" show the active line where the cursor is
set cursorline

" change the cursor between Normal and Insert modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" lessen time it takes for non-escape type letter sequences to complete
:set ttimeoutlen=100

" create the necessary folders for placing swap files and others in vim root
let s:VIMROOT = $HOME."/.vim"

if exists("*mkdir")
    silent! call mkdir(s:VIMROOT."/swap", "p")
    silent! call mkdir(s:VIMROOT."/undo", "p")
    silent! call mkdir(s:VIMROOT."/backup", "p")
else
    echo "Error: Create the directories: ".s:VIMROOT."/swap/, ".s:VIMROOT."/undo/, ".s:VIMROOT.."/backup/ first."
endif

let &backupdir=s:VIMROOT.'/backup//' " double slash means make the filename unique
let &directory=s:VIMROOT.'/swap//'
let &undodir=s:VIMROOT.'/undo//'

" search down into subfolders
" provides tab-completion for all file-related tasks
set path+=**