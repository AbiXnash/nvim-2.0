return {
    { 'brenoprata10/nvim-highlight-colors', opts = {} },
    { "b0o/schemastore.nvim" },
    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        config = true,
    },
    { "b0o/schemastore.nvim" },
    -- ~/.config/nvim/lua/plugins/lsp.lua
    -- 1. TypeScript & JavaScript LSP (replaces tsserver + extras)
    {
        "pmizio/typescript-tools.nvim",
        ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- Enable JSDoc support via tsserver
            settings = {
                tsserver = {
                    implicitProjectConfiguration = {
                        checkJs = true, -- Enable type checking in .js
                        strictNullChecks = true,
                    },
                    -- JSDoc: Full support via tsserver (no extra plugin needed)
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

    -- 2. Optional: Mason for automatic server install
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "typescript-language-server",
                "prettierd",
                "eslint_d",
            },
        },
    },
}
