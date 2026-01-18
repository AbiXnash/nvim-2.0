-- =============================================================================
-- LSP Keymaps Module
-- =============================================================================
-- Standard LSP keybindings organized by category
-- =============================================================================

local C = require("abx.config")

local M = {}

-- =============================================================================
-- Keymap Helper
-- =============================================================================
local function map(mode, lhs, rhs, desc, opts)
    local default_opts = {
        buffer = nil,
        silent = true,
        noremap = true,
    }
    vim.keymap.set(mode, lhs, rhs, vim.tbl_deep_extend("force", default_opts, opts or {}, { desc = "LSP: " .. desc }))
end

local function nmap(lhs, rhs, desc, opts)
    map("n", lhs, rhs, desc, opts)
end

local function imap(lhs, rhs, desc, opts)
    map("i", lhs, rhs, desc, opts)
end

local function vmap(lhs, rhs, desc, opts)
    map({ "n", "v" }, lhs, rhs, desc, opts)
end

-- =============================================================================
-- Navigation Keymaps
-- =============================================================================
function M.setup_navigation(bufnr)
    map("n", "gd", vim.lsp.buf.definition, "Go to definition", { buffer = bufnr })
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration", { buffer = bufnr })
    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation", { buffer = bufnr })
    map("n", "gr", vim.lsp.buf.references, "Go to references", { buffer = bufnr })
    map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition", { buffer = bufnr })
end

-- =============================================================================
-- Information Keymaps
-- =============================================================================
function M.setup_information(bufnr)
    map("n", "K", vim.lsp.buf.hover, "Hover documentation", { buffer = bufnr })
    map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help", { buffer = bufnr })
    map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help", { buffer = bufnr })
    map("n", "gs", vim.lsp.buf.signature_help, "Signature documentation", { buffer = bufnr })
end

-- =============================================================================
-- Code Actions Keymaps
-- =============================================================================
function M.setup_code_actions(bufnr)
    vmap("<leader>ca", vim.lsp.buf.code_action, "Code action", { buffer = bufnr })
    nmap("<leader>la", vim.lsp.buf.code_action, "Code action (alt)", { buffer = bufnr })
    nmap("<leader>rn", vim.lsp.buf.rename, "Rename symbol", { buffer = bufnr })
    nmap("<leader>lr", vim.lsp.buf.rename, "Rename all references", { buffer = bufnr })
    nmap("<leader>cf", function()
        vim.lsp.buf.format({ async = true })
    end, "Format buffer", { buffer = bufnr })
    nmap("<leader>lf", vim.lsp.buf.format, "Format (alt)", { buffer = bufnr })
end

-- =============================================================================
-- Diagnostics Keymaps
-- =============================================================================
function M.setup_diagnostics(bufnr)
    nmap("[d", vim.diagnostic.goto_prev, "Previous diagnostic", { buffer = bufnr })
    nmap("]d", vim.diagnostic.goto_next, "Next diagnostic", { buffer = bufnr })
    nmap("<leader>cd", vim.diagnostic.open_float, "Show diagnostic", { buffer = bufnr })
    nmap("<leader>cl", vim.diagnostic.setloclist, "Diagnostics to loclist", { buffer = bufnr })
    nmap("gl", vim.diagnostic.open_float, "Open diagnostic float", { buffer = bufnr })
end

-- =============================================================================
-- Workspace Keymaps
-- =============================================================================
function M.setup_workspace(bufnr)
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder", { buffer = bufnr })
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder", { buffer = bufnr })
    nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "List workspace folders", { buffer = bufnr })
end

-- =============================================================================
-- Telescope Integration
-- =============================================================================
function M.setup_telescope(bufnr)
    local telescope = C.safe_require("telescope.builtin")
    if not telescope then return end

    nmap("<leader>D", telescope.lsp_type_definitions, "Type definitions", { buffer = bufnr })
    nmap("<leader>ds", telescope.lsp_document_symbols, "Document symbols", { buffer = bufnr })
end

-- =============================================================================
-- Vertical Split Definition
-- =============================================================================
function M.setup_vsplit(bufnr)
    nmap("<leader>v", function()
        vim.cmd("vsplit")
        vim.lsp.buf.definition()
    end, "Go to definition in vertical split", { buffer = bufnr })
end

-- =============================================================================
-- Setup All Keymaps
-- =============================================================================
function M.setup_keymaps(bufnr)
    M.setup_navigation(bufnr)
    M.setup_information(bufnr)
    M.setup_code_actions(bufnr)
    M.setup_diagnostics(bufnr)
    M.setup_workspace(bufnr)
    M.setup_telescope(bufnr)
    M.setup_vsplit(bufnr)
end

return M
