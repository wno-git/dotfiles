" config
set textwidth=80
set tabstop=4
set shiftwidth=4
set expandtab
set number
set scrolloff=20
set cursorline
set ignorecase
set autoindent
set smartindent
set fillchars=vert:\ 

" syntax
syntax enable
autocmd BufNewFile,BufRead SCons* set filetype=scons
let c_space_errors = 1 " whitespace warnings
set cindent
set cinkeys-=0# " indent preprocessor directives

" look
set t_Co=256
colorscheme molokai
highlight ColorColumn ctermbg=234

" https://stackoverflow.com/questions/235439
highlight OverLength ctermbg=250 ctermfg=234
match OverLength /\%81v.\+/

" status
set laststatus=2
set statusline=%m\ %t%=%9.(%=%l,%c%)\ %P\ %y

" keybinds
let mapleader = ","
map <C-j> }
map <C-k> {
map <Leader>w :write<CR>
imap § <Esc>
vmap § <Esc>
