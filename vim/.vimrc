" config
set textwidth=80
set colorcolumn=80
set tabstop=4
set shiftwidth=4
set expandtab
set number
set scrolloff=20
set cursorline
set fillchars=vert:\ 

" syntax
syntax enable
autocmd BufNewFile,BufRead SCons* set filetype=scons
let c_space_errors = 1

" look
set t_Co=256
colorscheme molokai
set background=light
highlight ColorColumn ctermbg=darkgrey

" status
set laststatus=2
set statusline=%m\ %t%=%9.(%=%l,%c%)\ %P\ %y

" keybinds
let mapleader = ","
map <C-j> }
map <C-k> {
map <Leader>w :write<CR>
imap § <Esc>
