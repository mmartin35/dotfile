-- Key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Window navigation
map('n', '<C-1>', '<C-w>h', opts)  -- Move left
map('n', '<C-2>', '<C-w>l', opts)  -- Move right

-- File explorer and splits
map('n', '<C-p>', ':Telescope file_browser<CR>', opts)  -- Open file browser
map('n', '<C-s>', ':vsplit<CR>', opts)                 -- Vertical split

-- Buffer navigation
map('n', '<PageUp>', ':bprev<CR>', opts)    -- Previous buffer
map('n', '<PageDown>', ':bnext<CR>', opts)  -- Next buffer
