-- LSP Utility Commands module

-- LspRestart: Restart LSP clients for current buffer
vim.api.nvim_create_user_command("LspRestart", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    if #clients == 0 then
        vim.notify("No LSP clients attached to restart", vim.log.levels.WARN)
        return
    end

    for _, client in ipairs(clients) do
        vim.notify("Restarting " .. client.name, vim.log.levels.INFO)
        vim.lsp.stop_client(client.id)
    end

    vim.defer_fn(function()
        vim.cmd("edit")
    end, 100)
end, { desc = "Restart LSP clients for current buffer" })

-- LspStatus: Show brief LSP status
vim.api.nvim_create_user_command("LspStatus", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    if #clients == 0 then
        print("󰅚 No LSP clients attached")
        return
    end

    print("󰒋 LSP Status for buffer " .. bufnr .. ":")
    print("─────────────────────────────────")

    for i, client in ipairs(clients) do
        print(string.format("󰌘 Client %d: %s (ID: %d)", i, client.name, client.id))
        print("  Root: " .. (client.config.root_dir or "N/A"))
        print("  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))

        local caps = client.server_capabilities
        local features = {}
        if caps.completionProvider then table.insert(features, "completion") end
        if caps.hoverProvider then table.insert(features, "hover") end
        if caps.definitionProvider then table.insert(features, "definition") end
        if caps.referencesProvider then table.insert(features, "references") end
        if caps.renameProvider then table.insert(features, "rename") end
        if caps.codeActionProvider then table.insert(features, "code_action") end
        if caps.documentFormattingProvider then table.insert(features, "formatting") end

        print("  Features: " .. table.concat(features, ", "))
        print("")
    end
end, { desc = "Show brief LSP status" })

-- LspCapabilities: Show all capabilities for attached LSP clients
vim.api.nvim_create_user_command("LspCapabilities", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    if #clients == 0 then
        print("No LSP clients attached")
        return
    end

    for _, client in ipairs(clients) do
        print("Capabilities for " .. client.name .. ":")
        local caps = client.server_capabilities

        local capability_list = {
            { "Completion",                caps.completionProvider },
            { "Hover",                     caps.hoverProvider },
            { "Signature Help",            caps.signatureHelpProvider },
            { "Go to Definition",          caps.definitionProvider },
            { "Go to Declaration",         caps.declarationProvider },
            { "Go to Implementation",      caps.implementationProvider },
            { "Go to Type Definition",     caps.typeDefinitionProvider },
            { "Find References",           caps.referencesProvider },
            { "Document Highlight",        caps.documentHighlightProvider },
            { "Document Symbol",           caps.documentSymbolProvider },
            { "Workspace Symbol",          caps.workspaceSymbolProvider },
            { "Code Action",               caps.codeActionProvider },
            { "Code Lens",                 caps.codeLensProvider },
            { "Document Formatting",       caps.documentFormattingProvider },
            { "Document Range Formatting", caps.documentRangeFormattingProvider },
            { "Rename",                    caps.renameProvider },
            { "Folding Range",             caps.foldingRangeProvider },
            { "Selection Range",           caps.selectionRangeProvider },
            { "Inlay Hint",                caps.inlayHintProvider },
        }

        for _, cap in ipairs(capability_list) do
            local status = cap[2] and "✓" or "✗"
            print(string.format("  %s %s", status, cap[1]))
        end
        print("")
    end
end, { desc = "Show all LSP capabilities" })

-- LspDiagnostics: Show diagnostic counts
vim.api.nvim_create_user_command("LspDiagnostics", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local diagnostics = vim.diagnostic.get(bufnr)

    local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

    for _, diagnostic in ipairs(diagnostics) do
        local severity = vim.diagnostic.severity[diagnostic.severity]
        counts[severity] = counts[severity] + 1
    end

    print("󰒡 Diagnostics for current buffer:")
    print("  Errors: " .. counts.ERROR)
    print("  Warnings: " .. counts.WARN)
    print("  Info: " .. counts.INFO)
    print("  Hints: " .. counts.HINT)
    print("  Total: " .. #diagnostics)
end, { desc = "Show diagnostic counts for current buffer" })

-- LspDetails: Comprehensive LSP information
vim.api.nvim_create_user_command("LspDetails", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    print("═══════════════════════════════════")
    print("           LSP INFORMATION          ")
    print("═══════════════════════════════════")
    print("")

    print("󰈙 Language client log: " .. vim.lsp.get_log_path())
    print("󰈔 Detected filetype: " .. vim.bo.filetype)
    print("󰈮 Buffer: " .. bufnr)
    print("󰈔 Root directory: " .. (vim.fn.getcwd() or "N/A"))
    print("")

    if #clients == 0 then
        print("󰅚 No LSP clients attached to buffer " .. bufnr)
        print("")
        print("Possible reasons:")
        print("  • No language server installed for " .. vim.bo.filetype)
        print("  • Language server not configured")
        print("  • Not in a project root directory")
        print("  • File type not recognized")
        return
    end

    print("󰒋 LSP clients attached to buffer " .. bufnr .. ":")
    print("─────────────────────────────────")

    for i, client in ipairs(clients) do
        print(string.format("󰌘 Client %d: %s", i, client.name))
        print("  ID: " .. client.id)
        print("  Root dir: " .. (client.config.root_dir or "Not set"))
        print("  Command: " .. table.concat(client.config.cmd or {}, " "))
        print("  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))

        if client.is_stopped() then
            print("  Status: 󰅚 Stopped")
        else
            print("  Status: 󰄬 Running")
        end

        if client.workspace_folders and #client.workspace_folders > 0 then
            print("  Workspace folders:")
            for _, folder in ipairs(client.workspace_folders) do
                print("    • " .. folder.name)
            end
        end

        local attached_buffers = {}
        for buf, _ in pairs(client.attached_buffers or {}) do
            table.insert(attached_buffers, buf)
        end
        print("  Attached buffers: " .. #attached_buffers)

        local caps = client.server_capabilities
        local key_features = {}
        if caps.completionProvider then table.insert(key_features, "completion") end
        if caps.hoverProvider then table.insert(key_features, "hover") end
        if caps.definitionProvider then table.insert(key_features, "definition") end
        if caps.documentFormattingProvider then table.insert(key_features, "formatting") end
        if caps.codeActionProvider then table.insert(key_features, "code_action") end

        if #key_features > 0 then
            print("  Key features: " .. table.concat(key_features, ", "))
        end

        print("")
    end

    local diagnostics = vim.diagnostic.get(bufnr)
    if #diagnostics > 0 then
        print("󰒡 Diagnostics Summary:")
        local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

        for _, diagnostic in ipairs(diagnostics) do
            local severity = vim.diagnostic.severity[diagnostic.severity]
            counts[severity] = counts[severity] + 1
        end

        print("  󰅚 Errors: " .. counts.ERROR)
        print("  󰀪 Warnings: " .. counts.WARN)
        print("  󰋽 Info: " .. counts.INFO)
        print("  󰌶 Hints: " .. counts.HINT)
        print("  Total: " .. #diagnostics)
    else
        print("󰄬 No diagnostics")
    end

    print("")
    print("Use :LspLog to view detailed logs")
    print("Use :LspCapabilities for full capability list")
end, { desc = "Show comprehensive LSP information" })

vim.api.nvim_create_user_command("LspInstalled", function()
    print("═══════════════════════════════════")
    print("      INSTALLED LSP SERVERS        ")
    print("═══════════════════════════════════")
    print("")

    local registered = vim.lsp._config_clients or {}
    local names = vim.tbl_keys(registered)

    print("󰒋 Installed servers (" .. #names .. "):")
    if #names == 0 then
        print("  • No servers installed via vim.lsp.enable()")
    else
        for _, name in ipairs(names) do
            print("  • " .. name)
        end
    end

    print("")
    print("═══════════════════════════════════")
end, { desc = "List all installed LSP servers" })

vim.api.nvim_create_user_command("LspList", function()
    print("═══════════════════════════════════")
    print("            LSP DETAILS             ")
    print("═══════════════════════════════════")
    print("")

    -------------------------------------------------------------------------
    -- 1. Active clients for current buffer
    -------------------------------------------------------------------------
    local bufnr = vim.api.nvim_get_current_buf()
    local active = vim.lsp.get_clients({ bufnr = bufnr })

    print("󰄬 Active clients for current buffer (" .. #active .. "):")
    if #active == 0 then
        print("  • No LSP clients attached")
    else
        for _, client in ipairs(active) do
            print("  • " .. client.name .. " (ID " .. client.id .. ")")
        end
    end
    print("")

    -------------------------------------------------------------------------
    -- 2. All active LSP clients (global)
    -------------------------------------------------------------------------
    local global_clients = vim.lsp.get_clients()

    print("󰒇 Globally active LSP clients (" .. #global_clients .. "):")
    if #global_clients == 0 then
        print("  • None loaded")
    else
        for _, client in ipairs(global_clients) do
            print("  • " .. client.name .. " (ID " .. client.id .. ")")
        end
    end
    print("")

    -------------------------------------------------------------------------
    -- 3. Registered LSP servers (via vim.lsp._config_clients)
    -------------------------------------------------------------------------
    local registered = vim.tbl_keys(vim.lsp._config_clients or {})

    print("󰒋 Registered LSP server configs (" .. #registered .. "):")
    if #registered == 0 then
        print("  • No servers registered via vim.lsp.enable()")
    else
        for _, name in ipairs(registered) do
            print("  • " .. name)
        end
    end
    print("")

    print("═══════════════════════════════════")
    print(" Use :LspInfo for full diagnostics  ")
    print("═══════════════════════════════════")
end, { desc = "List installed / active / registered LSP servers" })