-- =============================================================================
-- ABX Neovim Configuration
-- =============================================================================
-- A modern, modular Neovim configuration built for Neovim 0.10+
-- Features: LSP, completion, debugging, testing, and more
-- =============================================================================

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Clone lazy.nvim if not installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "http://github.com/folke/lazy.nvim.git"
    local _ = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })

    -- Exit on clone failure
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim!!\n", "ErrorMsg" },
            { "Please check your internet connection.\n", "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- =============================================================================
-- Load Core Configurations
-- =============================================================================
-- Order matters: options → remaps → autocmd → plugins → lsp
-- =============================================================================
require("abx.configs.options")    -- Editor options (vim.opt)
require("abx.configs.remaps")     -- Key mappings
require("abx.configs.autocmd")    -- Autocommands

-- =============================================================================
-- Initialize Plugin Manager
-- =============================================================================
require("lazy").setup({
    spec = {
        -- Import all plugins from abx/plugins directory
        { import = "abx.plugins" },
    },
    -- Plugin checker disabled (manual updates)
    checker = { enabled = false },
    -- Don't notify on config changes
    change_detection = { notify = false },
})

-- =============================================================================
-- Load LSP Configuration
-- =============================================================================
-- Must be loaded after plugins for proper initialization
-- =============================================================================
require("abx.core.lsp")
