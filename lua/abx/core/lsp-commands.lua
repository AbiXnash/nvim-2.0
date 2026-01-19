-- =============================================================================
-- LSP Utility Commands
-- =============================================================================
-- User commands for LSP management and diagnostics
-- =============================================================================

local C = require("abx.config")

-- =============================================================================
-- Helper: Get active clients for current buffer
-- =============================================================================
local function get_active_clients()
    local bufnr = vim.api.nvim_get_current_buf()
    return vim.lsp.get_clients({ bufnr = bufnr })
end

-- =============================================================================
-- Helper: Format client capabilities for display
-- =============================================================================
local function format_capabilities(caps)
    local features = {}
    local capability_map = {
        completionProvider = "completion",
        hoverProvider = "hover",
        definitionProvider = "definition",
        referencesProvider = "references",
        renameProvider = "rename",
        codeActionProvider = "code_action",
        documentFormattingProvider = "formatting",
        implementationProvider = "implementation",
        typeDefinitionProvider = "type_definition",
        signatureHelpProvider = "signature_help",
        documentSymbolProvider = "document_symbol",
        workspaceSymbolProvider = "workspace_symbol",
        codeLensProvider = "code_lens",
        documentHighlightProvider = "document_highlight",
        foldingRangeProvider = "folding_range",
        inlayHintProvider = "inlay_hints",
    }

    for cap, enabled in pairs(capability_map) do
        if caps[cap] then
            table.insert(features, enabled)
        end
    end

    return features
end

-- =============================================================================
-- Command: LspRestart
-- =============================================================================
vim.api.nvim_create_user_command("LspRestart", function()
    local clients = get_active_clients()

    if #clients == 0 then
        vim.notify("No LSP clients attached to restart", vim.log.levels.WARN)
        return
    end

    for _, client in ipairs(clients) do
        vim.notify(string.format("Restarting %s (ID: %d)", client.name, client.id), vim.log.levels.INFO)
        vim.lsp.stop_client(client.id)
    end

    vim.defer_fn(function()
        vim.cmd("edit")
    end, 100)
end, { desc = "Restart LSP clients for current buffer" })

-- =============================================================================
-- Command: LspStatus
-- =============================================================================
vim.api.nvim_create_user_command("LspStatus", function()
    local clients = get_active_clients()
    local bufnr = vim.api.nvim_get_current_buf()

    if #clients == 0 then
        print("No LSP clients attached to buffer " .. bufnr)
        return
    end

    print(string.format("LSP Status for buffer %d:", bufnr))
    print("─────────────────────────────────")

    for _, client in ipairs(clients) do
        print(string.format("Client: %s (ID: %d)", client.name, client.id))
        print(string.format("  Root: %s", client.config.root_dir or "N/A"))
        print(string.format("  Filetypes: %s", table.concat(client.config.filetypes or {}, ", ")))

        local features = format_capabilities(client.server_capabilities)
        print(string.format("  Features: %s", #features > 0 and table.concat(features, ", ") or "none"))
        print("")
    end
end, { desc = "Show brief LSP status" })

-- =============================================================================
-- Command: LspCapabilities
-- =============================================================================
vim.api.nvim_create_user_command("LspCapabilities", function()
    local clients = get_active_clients()

    if #clients == 0 then
        print("No LSP clients attached")
        return
    end

    for _, client in ipairs(clients) do
        print(string.format("Capabilities for %s:", client.name))
        print("─────────────────────────────────")

        local caps = client.server_capabilities
        local capability_list = {
            { "Completion", caps.completionProvider },
            { "Hover", caps.hoverProvider },
            { "Signature Help", caps.signatureHelpProvider },
            { "Go to Definition", caps.definitionProvider },
            { "Go to Declaration", caps.declarationProvider },
            { "Go to Implementation", caps.implementationProvider },
            { "Go to Type Definition", caps.typeDefinitionProvider },
            { "Find References", caps.referencesProvider },
            { "Document Highlight", caps.documentHighlightProvider },
            { "Document Symbol", caps.documentSymbolProvider },
            { "Workspace Symbol", caps.workspaceSymbolProvider },
            { "Code Action", caps.codeActionProvider },
            { "Code Lens", caps.codeLensProvider },
            { "Document Formatting", caps.documentFormattingProvider },
            { "Document Range Formatting", caps.documentRangeFormattingProvider },
            { "Rename", caps.renameProvider },
            { "Folding Range", caps.foldingRangeProvider },
            { "Selection Range", caps.selectionRangeProvider },
            { "Inlay Hint", caps.inlayHintProvider },
        }

        for _, cap in ipairs(capability_list) do
            local status = cap[2] and "✓" or "✗"
            print(string.format("  %s %s", status, cap[1]))
        end
        print("")
    end
end, { desc = "Show all LSP capabilities" })

-- =============================================================================
-- Command: LspDiagnostics
-- =============================================================================
vim.api.nvim_create_user_command("LspDiagnostics", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local diagnostics = vim.diagnostic.get(bufnr)

    local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

    for _, diagnostic in ipairs(diagnostics) do
        local severity = vim.diagnostic.severity[diagnostic.severity]
        counts[severity] = (counts[severity] or 0) + 1
    end

    print("Diagnostics for current buffer:")
    print(string.format("  Errors: %d", counts.ERROR or 0))
    print(string.format("  Warnings: %d", counts.WARN or 0))
    print(string.format("  Info: %d", counts.INFO or 0))
    print(string.format("  Hints: %d", counts.HINT or 0))
    print(string.format("  Total: %d", #diagnostics))
end, { desc = "Show diagnostic counts for current buffer" })

-- =============================================================================
-- Command: LspDetails
-- =============================================================================
vim.api.nvim_create_user_command("LspDetails", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = get_active_clients()

    print("═══════════════════════════════════")
    print("           LSP INFORMATION          ")
    print("═══════════════════════════════════")
    print("")

    print(string.format("Log path: %s", vim.lsp.get_log_path()))
    print(string.format("Filetype: %s", vim.bo.filetype))
    print(string.format("Buffer: %d", bufnr))
    print(string.format("Working directory: %s", vim.fn.getcwd() or "N/A"))
    print("")

    if #clients == 0 then
        print(string.format("No LSP clients attached to buffer %d", bufnr))
        print("")
        print("Possible reasons:")
        print("  • No language server installed for " .. vim.bo.filetype)
        print("  • Language server not configured")
        print("  • Not in a project root directory")
        print("  • File type not recognized")
        return
    end

    print(string.format("LSP clients attached to buffer %d:", bufnr))
    print("─────────────────────────────────")

    for _, client in ipairs(clients) do
        print(string.format("Client: %s", client.name))
        print(string.format("  ID: %d", client.id))
        print(string.format("  Root dir: %s", client.config.root_dir or "Not set"))
        local cmd = client.config.cmd
        if type(cmd) == "function" then
            cmd = tostring(cmd)
        elseif type(cmd) == "table" then
            cmd = table.concat(cmd, " ")
        else
            cmd = tostring(cmd or "N/A")
        end
        print(string.format("  Command: %s", cmd))
        print(string.format("  Filetypes: %s", table.concat(client.config.filetypes or {}, ", ")))
        print(string.format("  Status: %s", client.is_stopped() and "Stopped" or "Running"))

        if client.workspace_folders and #client.workspace_folders > 0 then
            print("  Workspace folders:")
            for _, folder in ipairs(client.workspace_folders) do
                print(string.format("    • %s", folder.name))
            end
        end

        local attached_count = 0
        for _ in pairs(client.attached_buffers or {}) do
            attached_count = attached_count + 1
        end
        print(string.format("  Attached buffers: %d", attached_count))

        local features = format_capabilities(client.server_capabilities)
        if #features > 0 then
            print(string.format("  Key features: %s", table.concat(features, ", ")))
        end

        print("")
    end

    local diagnostics = vim.diagnostic.get(bufnr)
    if #diagnostics > 0 then
        print("Diagnostics Summary:")
        local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

        for _, diagnostic in ipairs(diagnostics) do
            local severity = vim.diagnostic.severity[diagnostic.severity]
            counts[severity] = (counts[severity] or 0) + 1
        end

        print(string.format("  Errors: %d", counts.ERROR or 0))
        print(string.format("  Warnings: %d", counts.WARN or 0))
        print(string.format("  Info: %d", counts.INFO or 0))
        print(string.format("  Hints: %d", counts.HINT or 0))
        print(string.format("  Total: %d", #diagnostics))
    else
        print("No diagnostics")
    end

    print("")
    print("Use :LspLog to view detailed logs")
    print("Use :LspCapabilities for full capability list")
end, { desc = "Show comprehensive LSP information" })

-- =============================================================================
-- Command: LspInstalled
-- =============================================================================
vim.api.nvim_create_user_command("LspInstalled", function()
    print("═══════════════════════════════════")
    print("      INSTALLED LSP SERVERS        ")
    print("═══════════════════════════════════")
    print("")

    local registered = vim.tbl_keys(vim.lsp._config_clients or {})
    print(string.format("Installed servers (%d):", #registered))

    if #registered == 0 then
        print("  No servers installed via vim.lsp.enable()")
    else
        for _, name in ipairs(registered) do
            print(string.format("  • %s", name))
        end
    end

    print("")
    print("═══════════════════════════════════")
end, { desc = "List all installed LSP servers" })

-- =============================================================================
-- Command: LspList
-- =============================================================================
vim.api.nvim_create_user_command("LspList", function()
    print("═══════════════════════════════════")
    print("            LSP DETAILS             ")
    print("═══════════════════════════════════")
    print("")

    -- Active clients for current buffer
    local bufnr = vim.api.nvim_get_current_buf()
    local active = get_active_clients()

    print(string.format("Active clients for buffer %d:", bufnr))
    if #active == 0 then
        print("  None attached")
    else
        for _, client in ipairs(active) do
            print(string.format("  • %s (ID: %d)", client.name, client.id))
        end
    end
    print("")

    -- All active LSP clients
    local global_clients = vim.lsp.get_clients()
    print(string.format("Global active clients (%d):", #global_clients))
    if #global_clients == 0 then
        print("  None")
    else
        for _, client in ipairs(global_clients) do
            print(string.format("  • %s (ID: %d)", client.name, client.id))
        end
    end
    print("")

    -- Registered LSP servers
    local registered = vim.tbl_keys(vim.lsp._config_clients or {})
    print(string.format("Registered server configs (%d):", #registered))
    if #registered == 0 then
        print("  None registered")
    else
        for _, name in ipairs(registered) do
            print(string.format("  • %s", name))
        end
    end
    print("")

    print("═══════════════════════════════════")
    print(" Use :LspInfo for full diagnostics  ")
    print("═══════════════════════════════════")
end, { desc = "List installed / active / registered LSP servers" })
