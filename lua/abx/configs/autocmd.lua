-- =============================================================================
-- Autocommands Configuration
-- =============================================================================
-- Automatic commands that trigger on specific events
-- Groups are created for easy management and cleanup
-- =============================================================================

local C = require("abx.config")

-- =============================================================================
-- Yank Highlight
-- =============================================================================
-- Visual feedback when yanking (copying) text
C.create_augroup("yank-highlight", {
    {
        event = "TextYankPost",
        opts = {
            callback = function()
                vim.hl.on_yank()
            end,
        },
    },
})

-- =============================================================================
-- Python Auto-Format
-- =============================================================================
C.create_augroup("ConformAutoFormat", {
    {
        event = "BufWritePre",
        opts = {
            pattern = "*.py",
            callback = function(args)
                local conform = C.safe_require("conform")
                if conform then
                    conform.format({ bufnr = args.buf })
                end
            end,
        },
    },
})

-- =============================================================================
-- Go Auto-Format
-- =============================================================================
C.create_augroup("GoAutoFormat", {
    {
        event = "BufWritePre",
        opts = {
            pattern = "*.go",
            callback = function()
                vim.lsp.buf.format({ timeout_ms = C.lsp.format_timeout })
            end,
        },
    },
})

-- =============================================================================
-- Restore Cursor Position
-- =============================================================================
-- Remember last cursor position in files
C.create_augroup("restore-cursor", {
    {
        event = "BufReadPost",
        opts = {
            pattern = "*",
            callback = function()
                local bufnr = vim.api.nvim_get_current_buf()
                local ok, last_pos = pcall(vim.api.nvim_buf_get_var, bufnr, "last_cursor_pos")
                if ok and type(last_pos) == "table" then
                    vim.api.nvim_win_set_cursor(0, last_pos)
                end
            end,
        },
    },
    {
        event = "BufWinLeave",
        opts = {
            pattern = "*",
            callback = function()
                local ok, _ = pcall(vim.api.nvim_buf_del_var, vim.api.nvim_get_current_buf(), "last_cursor_pos")
                if ok then
                    local pos = vim.api.nvim_win_get_cursor(0)
                    vim.api.nvim_buf_set_var(vim.api.nvim_get_current_buf(), "last_cursor_pos", pos)
                end
            end,
        },
    },
})

-- =============================================================================
-- Highlight on Yank (Extended)
-- =============================================================================
C.create_augroup("yank-highlight-ext", {
    {
        event = "TextYankPost",
        opts = {
            pattern = "*",
            callback = function()
                vim.highlight.on_yank({
                    higroup = "IncSearch",
                    timeout = 300,
                })
            end,
        },
    },
})

-- =============================================================================
-- Auto-resize splits
-- =============================================================================
C.create_augroup("auto-resize-splits", {
    {
        event = "VimResized",
        opts = {
            pattern = "*",
            callback = function()
                vim.cmd("tabdo wincmd =")
            end,
        },
    },
})

-- =============================================================================
-- Enter terminal mode improvements
-- =============================================================================
C.create_augroup("terminal-improvements", {
    {
        event = "TermOpen",
        opts = {
            pattern = "*",
            callback = function()
                vim.opt_local.number = false
                vim.opt_local.relativenumber = false
                vim.opt_local.signcolumn = "no"
                vim.cmd("startinsert")
            end,
        },
    },
})
