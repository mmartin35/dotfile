set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a

noremap t :tree
noremap <PageUp> :
noremap <PageDown> :

cnoreabbrev tree NERDTree

call plug#begin('~/.config/nvim/plugged')
 Plug 'rebelot/kanagawa.nvim'
 Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
 Plug 'nvim-tree/nvim-web-devicons'
 Plug 'scrooloose/nerdtree'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'windwp/nvim-autopairs'
call plug#end()

colorscheme kanagawa

lua << EOF
require("nvim-autopairs").setup {}
require('lualine').setup()
EOF
