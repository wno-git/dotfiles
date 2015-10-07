" config
set textwidth=80
set tabstop=4
set shiftwidth=4
set expandtab
set number
set scrolloff=20
set cursorline
set ignorecase
set incsearch
set autoindent
set smartindent
set fillchars=vert:\ 
set wildmenu
set wildmode=list:full

" syntax
syntax enable
autocmd BufNewFile,BufRead SCons* set filetype=scons
let c_space_errors = 1 " whitespace warnings

" look
set t_Co=256
colorscheme molokai
highlight ColorColumn ctermbg=234

" gui
set guioptions=
set guifont=Bitstream\ Vera\ Sans\ Mono\ 16

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
imap § <Esc>
vmap § <Esc>
