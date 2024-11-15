-- Plugin setup using packer.nvim
require('packer').startup(function(use)
    -- Packer itself
    use 'wbthomason/packer.nvim'

    -- Appearance
    use { 'daltonmenezes/aura-theme', rtp = 'packages/neovim' }
    use 'nvim-lualine/lualine.nvim'

    -- File explorer
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Utils
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'windwp/nvim-autopairs'
--    use 'github/copilot.vim'

    -- Completion
    use 'hrsh7th/nvim-cmp'            -- Completion plugin
    use 'hrsh7th/cmp-nvim-lsp'        -- LSP completion source
    use 'neovim/nvim-lspconfig'       -- LSP configuration
    use 'hrsh7th/cmp-buffer'          -- Buffer completion
    use 'hrsh7th/cmp-path'            -- Path completion
    use 'L3MON4D3/LuaSnip'            -- Snippet engine
    use 'saadparwaiz1/cmp_luasnip'    -- LuaSnip completions

    -- LSP Installer
    use 'williamboman/mason.nvim'

    -- Dashboard
    use 'goolord/alpha-nvim'
end)

-- Telescope setup
require('telescope').setup {
    defaults = {
        mappings = {
            i = { ["<C-s>"] = require('telescope.actions').select_vertical },
        },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
        },
        media_files = {
            filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
            find_cmd = "rg",
        },
    },
}
require('telescope').load_extension('file_browser')
require('telescope').load_extension('media_files')

-- Treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "python" },
    highlight = { enable = true },
}

-- nvim-cmp setup
local cmp = require('cmp')
local lspconfig = require('lspconfig')

cmp.setup {
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
}

-- Autopairs
require('nvim-autopairs').setup {}

-- Lualine
require('lualine').setup {
    options = { theme = 'codedark' }
}

-- Alpha (Dashboard)
require('alpha').setup(require('alpha.themes.startify').config)
