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


-- =============================================================================
-- Go Auto-Format
-- =============================================================================
-- Automatically format Go files on save using LSP formatting
-- Uses gopls for formatting and import organization via code actions
-- Note: goimports formatting is also handled by conform.nvim (see formatters.lua)
-- =============================================================================
vim.api.nvim_create_autocmd("BufWritePre", {
    -- Create new augroup for Go format settings
    group = vim.api.nvim_create_augroup("GoAutoFormat", { clear = true }),
    -- Only trigger for Go files
    pattern = "*.go",
    callback = function()
        -- Format using LSP (uses gopls configured in lsp/gopls.lua)
        vim.lsp.buf.format({ timeout_ms = 1000 })
    end,
})


function nvim_create_augroups(definitions)
    -- Utility function to create autocmd groups from a definitions table
    -- Used for defining multiple autocommands in a structured way
    -- @param definitions Table of group names to autocmd definitions
    for group_name, definition in pairs(definitions) do
        -- Create each augroup
        vim.api.nvim_command('augroup ' .. group_name)
        vim.api.nvim_command('autocmd!')
        -- Add each autocmd definition to the group
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
            vim.api.nvim_command(command)
        end
        -- End the augroup definition
        vim.api.nvim_command('augroup END')
    end
end
