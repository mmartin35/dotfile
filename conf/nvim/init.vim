set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a

function! InsertStatuslineColor(mode)
    if a:mode == 'i'
        hi statusline ctermfg=3 ctermbg=0
    elseif a:mode == 'r'
        hi statusline ctermfg=4 ctermbg=0
    else
        hi statusline ctermfg=1 ctermbg=0
    endif
endfunction

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

function! User()
    return system("echo $USER | tr -d '\n'")
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=7 ctermbg=0
hi statusline ctermfg=7 ctermbg=0

cnoreabbrev tree NERDTree

call plug#begin('~/.config/nvim/plugged')
 Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
 Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
 Plug 'nvim-tree/nvim-web-devicons'
 Plug 'scrooloose/nerdtree'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'windwp/nvim-autopairs'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
call plug#end()

colorscheme catppuccin-mocha

lua << EOF
require("nvim-autopairs").setup {}
require('lualine').setup()
EOF
