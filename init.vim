" just some random text
" display a friendly ascii art cat on logging in
echo '(>^.^<)'

" using vim-plug for plugins
call plug#begin()

" to change colorschemes, just type :colorscheme <name-of-colorscheme>
" try lucius, one-dark, solarized8
Plug 'rafi/awesome-vim-colorschemes'

" Seems like this is not currently being supported but we will try it for the
" moment.  I have seen something about LSPs? language servers? for syntax,
" might be worth further investigation, but I want to be able to code offline
" anyway.  (DEC2021)
Plug 'elixir-editors/vim-elixir'

call plug#end()

" colorscheme
colorscheme solarized8

" add line numbers
set number
set numberwidth=4

" set mapleader and maplocalleader
let mapleader = ","
let maplocalleader = "\\"

" use - and _ to move a line down or up, respectively
noremap <leader>- ddp
noremap <leader>_ ddkkp

" use <c-u> to convert the current word to uppercase in both insert and
" normal modes
inoremap <leader><c-u> <esc>viwU<esc>ea
nnoremap <leader><c-u> viwU<esc>e

" make editing $MYVIMRC really easy
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" wrapping words or visually selected blocks in quotation marks
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>gv<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>gv<esc>

" map H in normal mode to go to the beginning of the current line.  Think of H
" as 'stronger' h.  Map L to go the end of the current line, 'stronger' l
nnoremap H 0
nnoremap L $

" map jk to <esc> (easier on the fingers) and map <esc> to <nop> to force
" myself to use jk
inoremap jk <esc>
inoremap <esc> <nop>

" -- This instructs neovim to set the formatprg for all elixir files to mix
"  format.  The hyphen indicates that the buffer should be supplied via stdin.
"  Type gggqG to format an entire file
autocmd FileType elixir setlocal formatprg=mix\ format\ -
