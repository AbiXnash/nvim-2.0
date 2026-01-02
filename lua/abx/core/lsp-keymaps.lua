-- LSP Keymaps module
local function setup_keymaps(bufnr)
    local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc, silent = true })
    end

    -- Navigation
    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "gr", vim.lsp.buf.references, "Go to references")
    map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")

    -- Information
    map("n", "K", vim.lsp.buf.hover, "Hover documentation")
    map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
    map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")

    -- Code actions
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")

    -- Diagnostics
    map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
    map("n", "<leader>cd", vim.diagnostic.open_float, "Show diagnostic")
    map("n", "<leader>cl", vim.diagnostic.setloclist, "Diagnostics to loclist")
    map("n", "gl", vim.diagnostic.open_float, "Open Diagnostic Float")

    -- Workspace
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "List workspace folders")

    -- Additional mappings
    map("n", "gs", vim.lsp.buf.signature_help, "Signature Documentation")
    map("n", "<leader>la", vim.lsp.buf.code_action, "Code Action")
    map("n", "<leader>lr", vim.lsp.buf.rename, "Rename all references")
    map("n", "<leader>lf", vim.lsp.buf.format, "Format")
    map("n", "<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

    -- Telescope-specific LSP mappings (if telescope is available)
    local ok, telescope = pcall(require, 'telescope.builtin')
    if ok then
        map("n", "<leader>D", telescope.lsp_type_definitions, "Type definitions")
        map("n", "<leader>ds", telescope.lsp_document_symbols, "Document symbols")
    end
end

return { setup_keymaps = setup_keymaps }