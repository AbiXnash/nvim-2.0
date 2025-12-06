return {
    -- The de-facto standard TypeScript setup in 2025
    {
        "pmizio/typescript-tools.nvim",
        ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
            -- Blink.cmp integration (optional but automatic if you have it)
            { "saghen/blink.cmp", optional = true },
        },
        opts = {
            on_attach = function(client, bufnr)
                -- Disable formatting from TSServer (we use conform.nvim / prettier)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false

                -- Your usual LSP keymaps (you probably have these globally already)
                local opts = { buffer = bufnr, noremap = true, silent = true }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>oi", ":TSToolsOrganizeImports<CR>", opts)
                vim.keymap.set("n", "<leader>ru", ":TSToolsRemoveUnused<CR>", opts)
                vim.keymap.set("n", "<leader>ai", ":TSToolsAddMissingImports<CR>", opts)

                -- Inlay hints (Neovim 0.10+)
                if vim.lsp.inlay_hint then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
            end,

            -- This table is passed almost 1:1 to tsserver
            settings = {
                tsserver_path = nil, -- use bundled version (recommended)
                tsserver_plugins = {
                    -- Optional: styled-components support
                    -- "@styled/typescript-styled-plugin",
                },
                jsx_close_tag = {
                    enable = true,
                    filetypes = { "javascriptreact", "typescriptreact" },
                },
                -- Exact equivalent of what you would put under ["typescript"] or ["javascript"] in lspconfig
                tsserver = {
                    implicitProjectConfiguration = {
                        checkJs = true,
                        strictNullChecks = true,
                        strictFunctionTypes = true,
                    },
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
            },

            -- Blink.cmp integration (detected automatically)
            capabilities = function()
                local ok, blink = pcall(require, "blink.cmp")
                if ok then
                    return blink.get_lsp_capabilities()
                end
                return vim.lsp.protocol.make_client_capabilities()
            end,
        },
    },
}
