" https://dougblack.io/words/a-good-vimrc.html

" Colors 
syntax enable           " enable syntax processing
colorscheme badwolf
hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=none

" Misc 
set ttyfast                     " faster redraw
set backspace=indent,eol,start

" Spaces & Tabs 
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent

" UI Layout
set number              " show line numbers
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
set nocursorline          " highlight current line
set wildmenu
"set lazyredraw
set showmatch           " higlight matching parenthesis

" Searching 
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches

" Line Shortcuts 
nnoremap j gj
nnoremap k gk

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
