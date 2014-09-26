set nocompatible

" **********************************************
" Setup pathogen"
filetype off
call pathogen#infect()
call pathogen#helptags() 

" **********************************************
" Look fancy"
" Feedback stuff
filetype plugin indent on
syntax on 
set shortmess +=I
set cursorline
set showcmd
set number
set scrolloff=3
set title
set nospell
"set completeopt-=preview
let &t_Co=256

" Colors
colorscheme jellybeans "darkocean jellybeans github256, distinguished
" GVim stuff
set guifont=Monospace\ 9
set guioptions-=T  "remove toolbar
set guioptions-=m
set guioptions-=r
setglobal guioptions-=L
setglobal guioptions-=l
setglobal guioptions-=R
setglobal guioptions-=r
setglobal guioptions-=b
setglobal guioptions-=h
setglobal guioptions-=e
set mouse=a
set nowrap

" Statusline
hi User1 ctermbg=black ctermfg=white   guibg=black guifg=white
set statusline=
set statusline+=%1*%<\                      " cut at start
set statusline+=[%n%H%M%R%W]\               " flags and buf no
set statusline+=%-40f\                      " path
set statusline+=%=%y\                       " file type
set statusline+=%{&ff}                      "file format
set statusline+=%10((%l,%c)%)\              " line and column
set statusline+=%P%*                        " percentage of file
set laststatus=2

" **********************************************
" Indenting"
"set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"set nosmartindent 
set smartindent
inoremap # X#
set autoindent
"set autoindent
"set smartindent
"set cindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" **********************************************
" Disable annoying auto-comments
autocmd FileType * setlocal formatoptions-=ro

" **********************************************
" Filesystem etc"
" Don't make swaps or backups ~.~ living the danger life ~.~
set nobackup
set nowritebackup
set noswapfile

" Automatically update after writes
set autoread

" **********************************************
" Searching"
set gdefault
set ignorecase 
set smartcase
set hlsearch
set incsearch
set wildignore=*.swp,*.bak,*.pyc,*.class,*.pdf,*.png,*.jpg

" **********************************************
" Ban arrow keys and F1"
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>
"
" Change directory to this file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" **********************************************
" Moving around windows and buffers"
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-l> :wincmd l<CR>
nmap <silent> <c-h> :wincmd h<CR>
map <F2> :b# <CR> 
map <F12> :w <CR> :make! <CR>

" **********************************************
" Running python, latex "
map <leader>rp k :w <CR> :!python % <CR>
map <leader>Rp :w <CR> :AsyncShell(python %) <CR>
map <leader>rt :w <CR> :!pdflatex % <CR>

" **********************************************
" Plugin-specific settings"
" Nerdtree
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
map <leader>nt :NERDTree <CR>
" Snipmate
let g:snippets_dir = "~/.vim/bundle/vim-snippets/snippets"

" **********************************************
" Try to save marks and jumps I guess?
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
set viminfo='100,f1

"***************************
" For checking colormaps
" map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

command! ShareScreen set guifont=Monospace\ 13
command! UnShare set guifont=Monospace\ 9
