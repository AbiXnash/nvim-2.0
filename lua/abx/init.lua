-- =============================================================================
-- ABX Neovim Configuration
-- =============================================================================
-- A modern, modular Neovim configuration built for Neovim 0.10+
-- Features: LSP, completion, debugging, testing, and more
-- =============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local ok, _ = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })

    if not ok then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim\n",              "ErrorMsg" },
            { "Please check your internet connection.\n", "WarningMsg" },
        }, true, {})
        return
    end
end

vim.opt.rtp:prepend(lazypath)

-- =============================================================================
-- Load Core Configurations
-- =============================================================================
require("abx.configs.options")
require("abx.configs.remaps")
require("abx.configs.autocmd")

-- =============================================================================
-- Initialize Plugin Manager
-- =============================================================================
require("lazy").setup({
    spec = {
        { import = "abx.plugins" },
    },
    checker = { enabled = false },
    change_detection = { notify = false },
})

-- =============================================================================
-- Load LSP Configuration
-- =============================================================================
require("abx.core.lsp")
