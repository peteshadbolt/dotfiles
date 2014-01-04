set nocompatible

" **********************************************
" Setup pathogen"{{{
filetype off
call pathogen#infect()
call pathogen#helptags() 
"}}}

" **********************************************
" Look fancy"{{{
" Feedback stuff
filetype plugin indent on
set cursorline
set showcmd
set number
set scrolloff=3
set title
set nospell
"set completeopt-=preview
let &t_Co=256
" Statusline
"set statusline=%F
"set statusline+=%y      
"set laststatus=2
" Colors
colorscheme jellybeans "darkocean jellybeans github256, distinguished
" GVim stuff
set guifont=Monospace\ 8
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
syntax on 
"}}}

" **********************************************
" Indenting"{{{
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
"}}}

" **********************************************
" Filesystem etc"{{{
" Don't make swaps or backups ~.~ living the danger life ~.~
set nobackup
set nowritebackup
set noswapfile

" Automatically cd to the dir of the current file
set autochdir
set autoread
"}}}

" **********************************************
" Searching"{{{
set gdefault
set ignorecase 
set smartcase
set hlsearch
set incsearch
set wildignore=*.swp,*.bak,*.pyc,*.class,*.pdf",*.png,*.jpg
"}}}

" **********************************************
" Ban arrow keys"{{{
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
"}}}

" **********************************************
" Moving around windows and buffers"{{{
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-l> :wincmd l<CR>
nmap <silent> <c-h> :wincmd h<CR>
map <F2> :b# <CR> 
"}}}

" **********************************************
" Running python, latex "{{{
map <leader>rp k :w <CR> :!python % <CR>
map <leader>Rp :w <CR> :AsyncShell(python %) <CR>
map <leader>rt :w <CR> :!pdflatex % <CR>
"}}}

" **********************************************
" Plugin-specific settings"{{{
" Nerdtree
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
" Snipmate
let g:snippets_dir = "~/.vim/bundle/vim-snippets/snippets"
map <leader>nt :NERDTree <CR>
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"autocmd FileType python set omnifunc=pythoncomplete#Complete
" Airline
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
"}}}

" **********************************************
" Displaying specific file formats"{{{
" Prose gives us a prose-like environment
function! Prose()
    noremap <buffer> j gj
    noremap <buffer> k gk
    setlocal formatoptions=1
    setlocal linebreak
    setlocal wrap
    setlocal spell spelllang=en_gb
    setlocal nocursorline
    :NoMatchParen
    "colorscheme github256
endfunction
"}}}

" Latex and markdown are prose-like"{{{
" TODO: This should use the :filetype plugin
au BufRead,BufNewFile *.tex,*.md,*.mkd call Prose()
"}}}

" **********************************************
" Saving settings"{{{
function! MakeSession()
  let b:filename = $HOME . "/.vim/sessions/session.vim" 
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  if argc()==0
      let b:filename = $HOME . "/.vim/sessions/session.vim"
      exe 'source ' b:filename
      echo "Loaded session!"
  endif
endfunction
au VimEnter * nested :call LoadSession()
au VimLeave * :call MakeSession()
"}}}
"
"
"***************************
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

