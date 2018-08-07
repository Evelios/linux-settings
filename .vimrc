syntax on
colorscheme molokai

" Learning Vim The Hard Way
let mapleader = ","
let maplocalleader = "//"

" ---- Macros ----
let @m = 'aMSG(SEV_I, (""));hhh'

" ---- Key Bindings ------------------------------------------------------------

" ---- Insert Mode ----

" Leave insert mode
inoremap jk <esc>l
inoremap <esc> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" ---- Visual Mode ----

" Leave visual mode
vnoremap jk <esc>
vnoremap <esc> <nop>

" ---- Normal Mode ----

" Edit your vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
" Source your vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Move to beginning / End of the line
nnoremap H ^
nnoremap L $
nnoremap $ <nop>
nnoremap ^ <nop>

" Move the current line down
nnoremap <leader>j ddp
" Move the current line up
nnoremap <leader>k kddpk

" Delete Line
nnoremap <leader>d dd
" Delete Line and edit it
nnoremap <leader>c ddO
" Surrount line with double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" Surround line with single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel



" ---- UI Config ---------------------------------------------------------------
set nowrap           " Do not wrap lines around. Let them get cut off
set number           " Show line numbers
set showcmd          " Show the previous command in the bottom bar
set cursorline       " Hilight the current cursor line
set showmatch        " Hilight matching brackets like [{()}]

"set wildmenu         " Visual autocomplete for command menu

" ---- Whitespace ----
set list
set listchars=tab:..

" ---- TABS ----
set tabstop=2        " The number of spaces a tab appears as
set softtabstop=2    " The number of spaces that are changed when tab is pressed
set shiftwidth=2     " The number of spaces to shift for automatic indentation    
set expandtab        " Expand tabs out into spaces as indicated in the previous lines
set autoindent       " Turn on auto indenting to match the previous line 
"set smartindent      " Trys to do smarter indenting than autoindent

