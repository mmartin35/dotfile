set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a

au VimEnter *  NERDTreeToggle

nnoremap <C-1> <C-w>h
nnoremap <C-2> <C-w>l
noremap <C-t> :NERDTreeToggle<CR>
noremap <C-c> :Copilot<CR>
noremap <C-s> :vsplit<CR>
noremap <PageUp> :
noremap <PageDown> :

call plug#begin('~/.config/nvim/plugged')
 Plug 'rebelot/kanagawa.nvim'
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'nvim-tree/nvim-web-devicons'
 Plug 'scrooloose/nerdtree'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'windwp/nvim-autopairs'
 Plug 'github/copilot.vim'
call plug#end()

colorscheme kanagawa

lua << EOF
require("nvim-autopairs").setup {}
require('lualine').setup()
EOF
