-- Main LSP Configuration
vim.lsp.enable({
    "lua_ls",        -- Lua language server
    "rust_analyzer", -- Rust language server
    "jsonls",        -- JSON language server
    "svelte",        -- Svelte language server
    "gopls",
    "basedpyright",
    "astro",
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))
capabilities = vim.tbl_deep_extend("force", capabilities, {
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(env)
        local client = vim.lsp.get_client_by_id(env.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
            vim.lsp.completion.enable(true, client.id, env.buf, { autotrigger = true })
        end
    end,
})

vim.diagnostic.config({
    signs = true,
    severity_sort = true,
})

-- Load LSP modules
require("abx.core.lsp-attach")
require("abx.core.lsp-commands")

-- ============================================================================
-- LSP Server Definitions
-- ============================================================================
-- Each server config is loaded from lsp/<server-name>.lua
-- These configs are automatically managed by Mason (see lua/plugins/mason.lua)