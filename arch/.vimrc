set number
" set relativenumber

" Create :W command that works like :w
command! W w

" Enable syntax highlighting
syntax on

"Use spaces instead of tabs
set expandtab

" Number of spaces for each indentation level
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Auto-indent new lines
set autoindent
set smartindent

" Show invisible characters
set list
set listchars=tab:→\ ,trail:·,extends:>,precedes:<

" Enable mouse support
set mouse=a

" Customize line number colors
highlight LineNr ctermfg=white ctermbg=NONE
highlight CursorLineNr ctermfg=white ctermbg=NONE cterm=bold
