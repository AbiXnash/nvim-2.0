return {
    { 'brenoprata10/nvim-highlight-colors', opts = {} },

    { "b0o/schemastore.nvim" },

    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "htmx" },
        config = true,
    },

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

                if vim.lsp.inlay_hint then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
            end,
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "html",
                "css",
                "scss",
                "less",
                "javascript",
                "typescript",
                "tsx",
                "htmx",
                "tailwind",
                "xml",
                "xsl",
                "svg",
                "tmpl",
                "sql",
                "kotlin",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        },
    },

    {
        "mrshmllow/document-color.nvim",
        ft = { "css", "scss", "less", "html", "htmx" },
        opts = {
            mode = "foreground",
        },
    },

    {
        "c0r73x/neotags.lua",
        ft = { "html", "htmx", "css", "javascript", "typescript" },
        opts = {
            update = true,
            current_buffer_only = false,
        },
    },
}
