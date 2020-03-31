" ------------------------------------------------------------------------------
" ---- VIMRC
" ------------------------------------------------------------------------------

"{{{ Leader Characters

nnoremap <space> <nop>
let g:mapleader = " "
let g:maplocalleader = ","

"}}}
"{{{ Testing

" Show the syntax hilighting group under the cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

func! ToggleConceal()
  if &conceallevel == 0
    set conceallevel=1
  else
    set conceallevel=0
  endif
endfunc

nnoremap <leader>'c :call ToggleConceal()<cr>

"}}}
"{{{ General Configuration

" ---- UI Config ----
syntax on
set nocompatible     " Override any potentially conflicting .vimrc files
filetype plugin indent on
let &background = 'dark'
colorscheme gruvbox

set nowrap            " Do not wrap lines around. Let them get cut off
set number            " Show line numbers
set showcmd           " Show the previous command in the bottom bar
set splitright        " Default split behavior send new vertical window right
set splitbelow        " Devault split behavior send new horizontal window down
set lazyredraw        " Only redraw when needed. Can lead to more responsive redraws
set tildeop           " Allows tilde ~ change case operator
set scrolloff=10      " Always have 10 lines of context when scrolling
set relativenumber    " Show line numbers in relative terms

" ---- Folding ----
set foldenable        " Enable folding
set foldlevelstart=3  " Open most folds by default
set foldnestmax=3     " Set the max fold level
set foldmethod=syntax " Folding styles: marker, manual, expr, syntax, diff

" ---- Bracket Matching ----
set showmatch         " Hilight matching brackets like [{()}]

" ---- Searching ----
set ignorecase        " Case insensitive search
set smartcase         " Case insensitive except when searching for a capital letter (needs ignorecase)
set incsearch         " Search as characters are entered
set hlsearch          " Hilight search matches

" ---- Invisible Characters ----
set list
set listchars=tab:._,trail:~

" ---- Wildmenu ----
set wildmenu
set wildmode=longest,full
set wildignorecase

" ---- Tabspace ----
inoremap <S-Tab> <C-V><Tab>
set tabstop=2        " The number of spaces a tab appears as
set softtabstop=2    " The number of spaces that are changed when tab is pressed
set shiftwidth=2     " The number of spaces to shift for automatic indentation
set expandtab        " Expand tabs out into spaces as indicated in the previous lines
set autoindent       " Turn on auto indenting to match the previous line
" set smartindent      " Trys to do smarter indenting than autoindent

" ---- Cursor Management ----
set cursorline       " Hilight the current cursorline
augroup cursorManagement
  au!
  autocmd InsertEnter,InsertLeave * set cursorline! " Toggle cursorline in insert mode
augroup END

" ---- Terminal Config ----
if has('nvim')
  let g:neoterm_autoinsert=1
  set inccommand=nosplit     " Realtime view of search and replace
endif

" ---- Misc ----

" Collapse folding characters in the .vimrc file
autocmd BufReadPost,BufNewFile .vimrc set foldmethod=marker

"}}}
"{{{ Plugin Settings

" ---- Vim-Plug ----
call plug#begin('~/.vim/plugged')

let plugins = [
      \'airblade/vim-gitgutter',
      \'antew/vim-elm-analyse',
      \'dense-analysis/ale',
      \'gf3/peg.vim',
      \'godlygeek/tabular',
      \'itchyny/lightline.vim',
      \'jceb/vim-orgmode',
      \'junegunn/goyo.vim',
      \'mengelbrecht/lightline-bufferline',
      \'morhetz/gruvbox',
      \'pangloss/vim-javascript',
      \'plasticboy/vim-markdown',
      \'reedes/vim-pencil',
      \'scrooloose/nerdcommenter',
      \'scrooloose/nerdtree',
      \'tomasr/molokai',
      \'vim-scripts/scrollfix',
      \'tpope/vim-speeddating',
      \'zaptic/elm-vim']

for plugin in plugins
  Plug plugin
endfor

call plug#end()

" ---- Ale ----
if has('nvim')
  let g:ale_fixers = { 'python': [
        \ 'autopep8',
        \ 'remove_trailing_lines',
        \ 'trim_whitespace'
        \ ]}

  let g:ale_linters = { 'python': [
        \ 'pylint',
        \ 'mypy',
        \ ]}

  " let g:ale_lint_on_text_changed
  let g:ale_lint_on_insert_leave = 1
  let g:ale_lint_on_enter = 1
  let g:ale_fix_on_save = 1
  let g:ale_linters_explicit = 1

  " Use the quickfix instead of loclist
  " let g:ale_set_loclist = 0
  " let g:ale_set_quickfix = 1
endif

" ---- Tabular ----
nnoremap <leader>a= :Tabularize /=<cr>
nnoremap <leader>a: :Tabularize /:<cr>
nnoremap <leader>a// :Tabularize /\/\/<cr>
nnoremap <leader>a, :Tabularize /,<cr>

" ---- Haskell Package Features ----
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" ---- NeoTex ----
let g:tex_flavor = 'latex'

" ---- Markdown ----
let g:markdown_fenced_languages = ['hs=haskell','py=python','js=javascript','sh','cpp','diff','make']

" ---- NERDTree ----

" Toggle the NERDTree file bar
nnoremap <leader>'f :NERDTreeToggle<cr>

" Close NERDTree when the only thing open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---- Lightline ----
set noshowmode

let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'buffers', 'modified' ] ]
  \},
\}

" Powerline Style Separators
let g:lightline.separator = {
  \ 'left': '', 'right': ''
\}
let g:lightline.subseparator = {
  \ 'left': '', 'right': ''
\}

" Lightline Bufferline Listings
" let g:lightline.tabline = {
 " \ 'left'  : [[ 'buffers' ]],
 " \ 'right' : [[ 'close' ]]
" \}

let g:lightline.component_expand = {
 \ 'buffers' : 'lightline#bufferline#buffers'
\}

let g:lightline.component_type = {
  \ 'buffers' : 'tabsel'
\}

" Allow for autoupdating of the 'modified' indicator
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" ---- Semantic Highlight ----
nnoremap <Leader>h :SemanticHighlightToggle<cr>

" ---- Scrollfix ----
" percentable of screen height to keep visual cursor on
let g:scrollfix=50

" ---- Python Syntax ----
let g:python_highlight_all = 1

"}}}
"{{{ Autogroups file auto commands

" augroup TrailingSpaces " Remove any trailing whitespace
  " au!
  " autocmd BufRead,BufWrite *.c,*.h,*.cpp,*.hpp,*.js,*.py,*.pl,*.sh,*.k,*.vim
        " \ if !&bin | silent! %s/\s\+$//ge | endif
" augroup END

"}}}
"{{{ Abbreviations

" Abbreviations can either be expanded with <C-]> or they can use the space
" escape and then the `Eatchar` function can be used for quicker expansion

" Consume the character around the cursor
" https://stackoverflow.com/questions/11858927/preventing-trailing-whitespace-when-using-vim-abbreviations
func! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

autocmd FileType cpp  inoreabbrev msg MSG(SEV_I, (""));<left><left><left><left><C-R>=Eatchar('\s')<CR>
autocmd FileType perl inoreabbrev msg MSG("I:");<left><left><left><C-R>=Eatchar('\s')<CR>
autocmd FileType perl inoreabbrev prn print("");<left><left><left><C-R>=Eatchar('\s')<CR>

"}}}
"{{{ Tab Management

" Move inbetween tabs
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>

" Close the current tab
nnoremap <leader>tc :tabclose<cr>

" Open up a new empty tab
nnoremap <leader>te :tabnew<cr>

" Open up the file under the cursor in a new tab
nnoremap <leader>to <c-w>gf

" Move the tabs
nnoremap <leader>tl :tabm +1<cr>
nnoremap <leader>th :tabm -1<cr>

"}}}
"{{{ Buffer Management

nnoremap <leader>wn :next<cr>
nnoremap <leader>wp :prev<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprev<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>bl :b#<cr>

"}}}
"{{{ Window Management

" Move between split windows
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

" Resize split windows
nnoremap <nop> :resize -4<cr>
nnoremap <nop> :resize +4<cr>
nnoremap <nop> :vertical resize +4<cr>
nnoremap <nop> :vertical resize -4<cr>
"}}}
"{{{ File Management

" Write to the file
nnoremap <c-s> :w<cr>
nnoremap <leader>fw :w<cr>
nnoremap <leader>ffw :w!<cr>

" Write and exit
nnoremap <leader>fx :x<cr>
nnoremap <leader>ffx :x!<cr>

" Quit the file
nnoremap <leader>fq :q<cr>
nnoremap <leader>ffq :qa!<cr>

"}}}
"{{{ Tags

nnoremap <leader>lt yiw:tag <c-r>"<cr>

"}}}
"{{{ Basic Keybindings

" Edit your vimrc
if has('nvim')
  nnoremap <leader>ve :tabe ~/.vimrc<cr>
else
  nnoremap <leader>ve :tabe $MYVIMRC<cr>
endif

" Reload or Source your vimrc
nnoremap <leader>vr :source $MYVIMRC<cr>

" Leave insert mode
inoremap jk <esc>l
inoremap Jk <esc>l
inoremap jK <esc>l
inoremap JK <esc>l
inoremap <esc> <nop>

" Insert a space in normal mode with spacebar
nnoremap <c-space> i<space><esc>l

" Insert a space after the cursor in normal mode
nnoremap <s-space> a<space><esc>h

" Insert a newline after the cursor in normal mode
nnoremap <c-cr> o<esc>

" Set Terminal Break As Escape Character
if has('nvim')
  tnoremap <Esc> <c-\><c-n>
endif

"}}}
"{{{ Syntax Keybindings

noremap <leader>sc :set syntax=combs<cr>
noremap <leader>sp :set syntax=pinfo<cr>
noremap <leader>sl :set syntax=log<cr>

" ---- Movement Keybindings ----

" Move to beginning / end of the line
noremap H 0
" noremap H ^   <-- Use this to go to the first character on the line
noremap L $
noremap $ <nop>
noremap ^ <nop>

" Move through softwrap lines
nnoremap j gj
nnoremap k gk

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

"}}}
"{{{ Copying, Cut, and Paste

noremap <leader>y "py
noremap <leader>d "pd
noremap <leader>p "pp
noremap <leader>P "pP

"}}}
"{{{ Normal Mode

" Move the current line
nnoremap <a-j> ddp
nnoremap <a-k> kddpk

" Remove Highlighting
nnoremap <leader>n :noh<cr>

" Execute the current file in vim
nnoremap <leader>e :!./%<cr>

" Insert a single character
nnoremap <leader>i i_<esc>r

" Join two lines - a remap from 'J'
nnoremap <leader>J J

"}}}
"{{{ Insert Mode

" ---- Code Syntax Additions ----

" Map Ctrl-Backspace to delete the previous word
inoremap <C-BS> <C-W>

"}}}
