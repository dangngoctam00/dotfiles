let &t_TI = ""
let &t_TE = ""


" Insert blank line
nmap <CR> o<Esc>

"Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

"if filereadable(expand("~/.vim/vimrc.plugged"))
" source ~/.vim/vimrc.plugged
"endif
colorscheme gruvbox " Set colorscheme
set background=dark " Set dark background

" Leader
let mapleader = " "
set clipboard=unnamedplus

set showcmd " display incomplete commane

set ruler "show the cursor position all the time
set incsearch "do incremental searching
set laststatus=2  " Always display the status line
set noswapfile

hi CursorLineNr ctermfg=3
set cursorline
"Numbers
set relativenumber number
set numberwidth=5

set autoindent
set smartindent

" Softtabs, 2 spaces
set tabstop=3
set shiftwidth=3
set shiftround
set expandtab

"highlight search result
set hlsearch

if has('mouse')
  set mouse=a
endif
" Make it obvious where 80 characters is
"set textwidth=80
"set colorcolumn=+1
" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>/ :split<CR>

nnoremap <C-Right> <C-W>l
nnoremap <C-Left> <C-W>h
nnoremap <C-Down> <C-W>j
nnoremap <C-Up> <C-W>k

" Remove highlight
map <C-h> :nohl<CR>
