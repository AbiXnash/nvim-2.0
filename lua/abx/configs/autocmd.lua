-- =============================================================================
-- Autocommands Configuration
-- =============================================================================
-- Automatic commands that trigger on specific events
-- Each autocmd is grouped for easy management
-- =============================================================================

-- =============================================================================
-- Yank Highlight
-- =============================================================================
-- Visual feedback when yanking (copying) text
-- Highlights the yanked text briefly
-- =============================================================================
vim.api.nvim_create_autocmd("TextYankPost", {
    -- Create new augroup, clearing any existing settings
    group = vim.api.nvim_create_augroup("yank-highlight", { clear = true }),
    callback = function()
        -- Built-in Neovim function to highlight yank
        vim.hl.on_yank()
    end,
})

-- =============================================================================
-- Python Auto-Format
-- =============================================================================
-- Automatically format Python files on save using conform.nvim
-- Uses configured formatters (black, isort, etc.)
-- =============================================================================
vim.api.nvim_create_autocmd("BufWritePre", {
    -- Create new augroup for format settings
    group = vim.api.nvim_create_augroup("ConformAutoFormat", { clear = true }),
    -- Only trigger for Python files
    pattern = "*.py",
    callback = function(args)
        -- Format the current buffer using conform
        require("conform").format({ bufnr = args.buf })
    end,
})