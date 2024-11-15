-- Load configurations
require('settings')     -- General settings
require('keymaps')      -- Key mappings
require('plugins')      -- Plugin installation and setup
require('lsp')          -- Language server setup

-- Toggle Copilot with a keybind and notify status
vim.g.copilot_enabled = false  -- Disable Copilot by default
local function enable_copilot()
    vim.g.copilot_enabled = not vim.g.copilot_enabled
    if vim.g.copilot_enabled then
        vim.notify("Copilot is enabled", vim.log.levels.INFO)
    else
        vim.notify("Copilot is disabled", vim.log.levels.INFO)
    end
end
vim.keymap.set('n', '<C-d>', enable_copilot, { noremap = true, silent = true })

-- Custom command
vim.api.nvim_create_user_command('Bind', function()
    print("General:")
    print("Ctrl+d           Toggle copilot")
    print("-----------------------------------")
    print("LSP:")
    print("Ctrl+k           Function prototype")
end, {})
