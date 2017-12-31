" editing

set cursorline
set expandtab
set list
set number
set scrolloff=20
set shiftwidth=4
set tabstop=4
set textwidth=80
set wildmode=list:full

" search

set ignorecase
set incsearch
set hlsearch

" syntax

autocmd BufNewFile,BufRead *.scala set filetype=scala
autocmd BufNewFile,BufRead *.frag,*.vert set filetype=glsl
let c_space_errors = 1 " whitespace warnings

" look

set termguicolors
set background=dark
colorscheme gruvbox

" https://stackoverflow.com/questions/235439
augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=250 ctermfg=234
    autocmd BufEnter * match OverLength /\%81v.\+/
augroup END
" end stackoverflow

" status

set laststatus=2
set statusline=%m\ %t%=%9.(%=%l,%c%)\ %P\ %y

" keybinds

let mapleader = ","
map <C-j> }
map <C-k> {
map <Leader>w :write<CR>
map <Leader>h :nohlsearch<CR>
map <Leader>e :Explore<CR>
map <Leader>t :Texplore<CR>
map <Leader>q :q<CR>
imap § <Esc>
vmap § <Esc>
