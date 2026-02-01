-- =============================================================================
-- Main LSP Configuration (Neovim 0.10+)
-- =============================================================================

local C = require("abx.config")

-- =============================================================================
-- Load Server Configurations
-- =============================================================================

local server_configs = {}

local server_dir = vim.fn.stdpath("config") .. "/lua/abx/lsp/servers"
local server_files = vim.fn.glob(server_dir .. "/*.lua", false, true)

for _, file_path in ipairs(server_files) do
    local module_name = "abx.lsp.servers." .. vim.fn.fnamemodify(file_path, ":t:r")
    local ok, config = pcall(require, module_name)

    if ok and type(config) == "table" then
        if vim.isarray(config) then
            -- Array style:
            -- { "gopls", { "lua_ls", settings = {...} } }
            for _, entry in ipairs(config) do
                if type(entry) == "string" then
                    server_configs[entry] = {}
                elseif type(entry) == "table" and type(entry[1]) == "string" then
                    local name = entry[1]
                    local cfg = vim.tbl_deep_extend("force", {}, entry)
                    cfg[1] = nil
                    server_configs[name] = cfg
                end
            end
        else
            -- Map style:
            -- { gopls = {...}, lua_ls = {...} }
            for name, cfg in pairs(config) do
                if type(name) == "string" and type(cfg) == "table" then
                    server_configs[name] = cfg
                end
            end
        end
    end
end

-- =============================================================================
-- Register LSP Configurations (IMPORTANT)
-- =============================================================================

vim.lsp.config = vim.lsp.config or {}

for server_name, server_config in pairs(server_configs) do
    vim.lsp.config[server_name] = server_config
end

-- =============================================================================
-- Enable LSP Servers (STRINGS ONLY)
-- =============================================================================

local servers_to_enable = {}

for _, server_name in ipairs(C.lsp.servers) do
    table.insert(servers_to_enable, server_name)
end

vim.lsp.enable(servers_to_enable)

-- =============================================================================
-- Capabilities
-- =============================================================================

local capabilities = vim.lsp.protocol.make_client_capabilities()

local blink = C.safe_require("blink.cmp")
if blink then
    capabilities = vim.tbl_deep_extend(
        "force",
        capabilities,
        blink.get_lsp_capabilities({}, false)
    )
end

capabilities = vim.tbl_deep_extend("force", capabilities, {
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        },
    },
})

vim.lsp.protocol.make_client_capabilities = function()
    return vim.deepcopy(capabilities)
end

-- =============================================================================
-- Diagnostic Configuration
-- =============================================================================

vim.diagnostic.config({
    signs = {
        priority = 20,
        text = {
            [vim.diagnostic.severity.ERROR] = C.lsp.diagnostic_signs.error,
            [vim.diagnostic.severity.WARN]  = C.lsp.diagnostic_signs.warn,
            [vim.diagnostic.severity.INFO]  = C.lsp.diagnostic_signs.info,
            [vim.diagnostic.severity.HINT]  = C.lsp.diagnostic_signs.hint,
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

        -- Detach unwanted clients for templ files
        local excluded_clients = { "html", "tailwindcss" }
        local filetype = vim.bo[bufnr].filetype

        if vim.tbl_contains(excluded_clients, client.name) and filetype == "templ" then
            vim.schedule(function()
                pcall(vim.lsp.buf_detach_client, bufnr, client.id)
            end)
            return
        end

        -- Encoding (string, not table)
        client.offset_encoding = "utf-16"

        -- Completion
        if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = {
                "menu",
                "menuone",
                "noinsert",
                "fuzzy",
                "popup",
            }
            vim.lsp.completion.enable(true, client.id, bufnr, {
                autotrigger = true,
            })
        end

        -- Keymaps
        require("abx.core.lsp-keymaps").setup_keymaps(bufnr)

        -- Omnifunc
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Inlay hints
        if client.server_capabilities.inlayHintProvider
            and vim.lsp.inlay_hint
        then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
    end,
})

-- =============================================================================
-- Load Extra LSP Modules
-- =============================================================================

require("abx.core.lsp-attach")
require("abx.core.lsp-commands")

