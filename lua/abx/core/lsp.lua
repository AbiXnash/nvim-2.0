-- =============================================================================
-- Main LSP Configuration
-- =============================================================================
-- Centralized LSP setup with proper capabilities and diagnostics
-- =============================================================================

local C = require("abx.config")

-- =============================================================================
-- Enable LSP Servers
-- =============================================================================
vim.lsp.enable(C.lsp.servers)

-- =============================================================================
-- Configure Capabilities
-- =============================================================================
local capabilities = vim.lsp.protocol.make_client_capabilities()

local blink = C.safe_require("blink.cmp")
if blink then
    capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities({}, false))
end

capabilities = vim.tbl_deep_extend("force", capabilities, {
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        },
    },
})

-- =============================================================================
-- Diagnostic Configuration
-- =============================================================================
vim.diagnostic.config({
    signs = {
        priority = 20,
        text = {
            [vim.diagnostic.severity.ERROR] = C.lsp.diagnostic_signs.error,
            [vim.diagnostic.severity.WARN] = C.lsp.diagnostic_signs.warn,
            [vim.diagnostic.severity.INFO] = C.lsp.diagnostic_signs.info,
            [vim.diagnostic.severity.HINT] = C.lsp.diagnostic_signs.hint,
        },
    },
    severity_sort = C.lsp.diagnostics.severity_sort,
})

-- =============================================================================
-- LSP Attach Autocmd
-- =============================================================================
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then return end

        local excluded_clients = { "html", "htmx", "tailwindcss" }
        local filetype = vim.bo[bufnr].filetype
        if vim.tbl_contains(excluded_clients, client.name) and filetype == "templ" then
            vim.schedule(function()
                pcall(vim.lsp.buf_detach_client, bufnr, client.id)
            end)
            return
        end

        client.offset_encoding = { "utf-16" }

        -- Setup completion
        if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
        end

        -- Setup buffer keymaps
        require("abx.core.lsp-keymaps").setup_keymaps(bufnr)

        -- Setup buffer options
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Enable inlay hints if supported
        if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
    end,
})

-- =============================================================================
-- Load LSP Modules
-- =============================================================================
require("abx.core.lsp-attach")
require("abx.core.lsp-commands")
