return {
    -- Color highlighting for CSS colors, hex codes, etc.
    { 'brenoprata10/nvim-highlight-colors', opts = {} },

    -- JSON schema integration
    { "b0o/schemastore.nvim" },

    -- Auto-close tags for HTML/JSX/TSX
    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        config = true,
    },

    -- TypeScript & JavaScript LSP with enhanced features
    {
        "pmizio/typescript-tools.nvim",
        ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            settings = {
                tsserver = {
                    implicitProjectConfiguration = {
                        checkJs = true,
                        strictNullChecks = true,
                    },
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayVariableTypeHints = true,
                    },
                },
                jsx_close_tag = { enable = true },
            },
            on_attach = function(client, bufnr)
                -- Disable formatting (use conform.nvim / prettier)
                client.server_capabilities.documentFormattingProvider = false

                local buf = vim.lsp.buf
                local key = function(mode, lhs, rhs)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
                end

                key("n", "gd", buf.definition)
                key("n", "K", buf.hover)
                key("n", "<leader>rn", buf.rename)
                key("n", "<leader>ca", buf.code_action)
                key("n", "<leader>oi", ":TSToolsOrganizeImports<CR>")
                key("n", "<leader>ai", ":TSToolsAddMissingImports<CR>")
                key("n", "<leader>ru", ":TSToolsRemoveUnused<CR>")

                -- Enable inlay hints (Neovim 0.11+)
                if vim.lsp.inlay_hint then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
            end,
        },
    },
}
