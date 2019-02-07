" ------------------------------------------------------------------------------
" ---- VIMRC
" ------------------------------------------------------------------------------
"   Sections
"   * Testing 
"   * Leader Characters
"   * General Configuration
"   * Plugin Settings
"   * Tab Management
"   * Buffer Management
"   * Window Management
"   * Abbreviations
"   * Key Bindings

" ------------------------------------------------------------------------------
" ---- Testing
" ------------------------------------------------------------------------------

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun

nnoremap <leader>t :call ShowFuncName() <CR>

" ------------------------------------------------------------------------------
" ---- Leader Characters
" ------------------------------------------------------------------------------
"
let mapleader = "'"
let maplocalleader = "//"

" ------------------------------------------------------------------------------
" ---- General Configuration
" ------------------------------------------------------------------------------

" ---- UI Config ----
syntax on
filetype plugin indent on
let &background = 'dark'
colorscheme gruvbox

set nowrap           " Do not wrap lines around. Let them get cut off
set number           " Show line numbers
set showcmd          " Show the previous command in the bottom bar
set cursorline       " Hilight the current cursor line
set showmatch        " Hilight matching brackets like [{()}]
set splitright       " Default split behavior send new vertical window right
set splitbelow       " Devault split behavior send new horizontal window down
"set wildmenu         " Visual autocomplete for command menu

" ---- Whitespace ----
" Show all tab characters
set list
set listchars=tab:._

" Show all trailing whitespace
highlight def link ExtraWhitespace Error
match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * redraw

" ---- Tabspace ----
inoremap <S-Tab> <C-V><Tab>
set tabstop=2        " The number of spaces a tab appears as
set softtabstop=2    " The number of spaces that are changed when tab is pressed
set shiftwidth=2     " The number of spaces to shift for automatic indentation
set expandtab        " Expand tabs out into spaces as indicated in the previous lines
set autoindent       " Turn on auto indenting to match the previous line
" set smartindent      " Trys to do smarter indenting than autoindent

" ---- Terminal Config ----
if has('nvim')
  let g:neoterm_autoinsert=1
endif

" ---- Haskell Package Features ----
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" ------------------------------------------------------------------------------
" ---- Plugin Settings
" ------------------------------------------------------------------------------

" ---- NeoTex ----
let g:tex_flavor = 'latex'

" ---- Markdown ----
let g:markdown_fenced_languages = ['hs=haskell']

" ---- NERDTree ----

" Open NERDTree when opening vim with no arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Toggle the NERDTree file bar
nnoremap <leader>f :NERDTreeToggle<cr>

" Close NERDTree when the only thing open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---- Lightline ----
set noshowmode

let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
  \ },
\ }

" Powerline Style Separators
let g:lightline.separator = {
  \   'left': '', 'right': ''
\ }
let g:lightline.subseparator = {
  \ 'left': '', 'right': ''
\ }

" ------------------------------------------------------------------------------
" ---- Tab Management
" ------------------------------------------------------------------------------

" Move inbetween tabs
nnoremap tn :tabnext<cr>
nnoremap tp :tabprevious<cr>

" Close the current tab
nnoremap tc :tabclose<cr>

" Open up a new empty tab
nnoremap te :tabnew<cr>

" Open up the file under the cursor in a new tab
nnoremap to <c-w>gf

" Move the tabs
nnoremap tl :tabm +1<cr>
nnoremap th :tabm -1<cr>

" ------------------------------------------------------------------------------
" ---- Buffer Management
" ------------------------------------------------------------------------------

nnoremap wn :n<cr>
nnoremap wp :prev<cr>

" ------------------------------------------------------------------------------
" ---- Window Management
" ------------------------------------------------------------------------------

" Move between split windows
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

if has('nvim')
  nnoremap <c-j> <c-\><c-n><c-w><c-j>
  nnoremap <c-k> <c-\><c-n><c-w><c-k>
  nnoremap <c-h> <c-\><c-n><c-w><c-h>
  nnoremap <c-l> <c-\><c-n><c-w><c-l>
endif

" Resize split windows
nnoremap <c-u> :resize -4<cr>
nnoremap <c-i> :resize +4<cr>

nnoremap <c-y> :vertical resize +4<cr>
nnoremap <c-o> :vertical resize -4<cr>

" ------------------------------------------------------------------------------
" ---- Abbreviations
" ------------------------------------------------------------------------------

" Abbreviate the directional arrows
iabbrev << <-
iabbrev >> ->

" ------------------------------------------------------------------------------
" ---- Key Bindings
" ------------------------------------------------------------------------------

" ---- Basic Keybindings ----

" Edit your vimrc
nnoremap <leader>ve :tabe $MYVIMRC<cr>
" Reload or Source your vimrc
nnoremap <leader>vr :source $MYVIMRC<cr>

" Leave insert mode
inoremap jk <esc>l
inoremap <esc> <nop>

" Quit Everything
nnoremap <leader>qq :qa<cr>

" Quit Everything Force
nnoremap <leader>qq :qa!<cr>

" Insert a space in normal mode with spacebar
nnoremap <space> i<space><esc>l

" Set Terminal Break As Escape Character
if has('nvim')
  tnoremap <Esc> <c-\><c-n>
endif

" ---- Movement Keybindings ----
"
" Move to beginning / end of the line
noremap H 0
" noremap H ^   <-- Use this to go to the first character on the line
noremap L $
noremap $ <nop>
noremap ^ <nop>

" Move through softwrap lines
noremap j gj
noremap k gk

" Move up / down half a page
noremap J <c-d>
noremap K <c-u>
noremap <c-d> <nop>
noremap <c-u> <nop>

" Unmap the arrow keys
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>


" ---- Normal Mode -------------------------------------------------------------

" Move the current line down
nnoremap <leader>j ddp
" Move the current line up
nnoremap <leader>k kddpk

" Enable Wrapping
nnoremap <leader>w :set wrap<cr>

" Remove Highlighting
nnoremap <leader>n :noh<cr>

" Turn object call to pointer call
"nnoremap <leader>p xi-><esc>

" Insert double quotes with terminating semicolon
nnoremap <leader>" a"";<esc>h
" Insert single quotes with terminating semicolon
nnoremap <leader>' a'';<esc>h

" Insert a function parenthesis and brackets
nnoremap <leader>( a() {<cr><tab><cr><bs>}<esc>kk$hh


" ---- Insert Mode -------------------------------------------------------------

" ---- Code Syntax Additions ----

" Add in the surrounding curly brackets
inoremap {{ {<cr><cr><bs>}<esc>k$a
