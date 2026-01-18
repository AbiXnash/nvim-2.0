-- =============================================================================
-- LSP Attach Handler
-- =============================================================================
-- Handles LSP client attachment with proper cleanup and setup
-- =============================================================================

local C = require("abx.config")

local M = {}

-- =============================================================================
-- Setup Keymaps
-- =============================================================================
function M.setup_keymaps(bufnr)
    require("abx.core.lsp-keymaps").setup_keymaps(bufnr)
end

-- =============================================================================
-- Setup Format on Save
-- =============================================================================
function M.setup_format_on_save(bufnr, client)
    if not client:supports_method("textDocument/formatting") then return end

    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
        end,
    })
end

-- =============================================================================
-- Setup Document Highlights
-- =============================================================================
function M.setup_document_highlight(bufnr, client)
    if not client.server_capabilities.documentHighlightProvider then return end

    local highlight_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = bufnr,
        group = highlight_group,
        callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = bufnr,
        group = highlight_group,
        callback = vim.lsp.buf.clear_references,
    })
end

-- =============================================================================
-- Setup Inlay Hints
-- =============================================================================
function M.setup_inlay_hints(bufnr, client)
    if not client.server_capabilities.inlayHintProvider then return end
    if not vim.lsp.inlay_hint then return end

    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end

-- =============================================================================
-- Cleanup Handler
-- =============================================================================
function M.setup_cleanup(bufnr)
    vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
        callback = function(event)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event.buf })
            vim.api.nvim_clear_autocmds({ group = "LspFormatOnSave", buffer = event.buf })
        end,
    })
end

-- =============================================================================
-- Main Attach Handler
-- =============================================================================
function M.on_attach(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then return end

    M.setup_keymaps(bufnr)
    M.setup_format_on_save(bufnr, client)
    M.setup_document_highlight(bufnr, client)
    M.setup_inlay_hints(bufnr, client)
    M.setup_cleanup(bufnr)

    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
end

-- =============================================================================
-- Initialize Attach Autocmd
-- =============================================================================
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = M.on_attach,
})

return M
