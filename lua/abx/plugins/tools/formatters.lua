-- =============================================================================
-- Formatters and Linters Configuration
-- =============================================================================
-- Code formatting and linting with conform.nvim and none-ls
-- =============================================================================

local C = require("abx.config")

local function conform_setup()
    local conform = require("conform")

    conform.setup({
        formatters_by_ft = {
            lua = { "prettierd" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            svelte = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescriptreact = { "prettierd" },
            python = { "black" },
            go = { "gofumpt", "goimports" },
            json = { "prettierd" },
            jsonc = { "prettierd" },
            markdown = { "prettierd" },
            html = { "prettierd" },
            htmx = { "prettierd" },
            css = { "prettierd" },
            scss = { "prettierd" },
            less = { "prettierd" },
            tailwindcss = { "prettierd", "tailwindcss-formatter" },
            yaml = { "prettierd" },
            sql = { "sqlfluff" },
            kotlin = { "ktlint" },
            astro = { "prettierd" },
            java = { "google-java-format" },
            rust = { "rustfmt" },
            c = { "clang-format" },
            cpp = { "clang-format" },
        },
        formatters = {
            prettierd = {
                args = function(ctx)
                    if ctx.filename then
                        return vim.list_extend(
                            C.formatters.prettier_args,
                            { "--stdin-filepath", vim.fs.basename(ctx.filename) }
                        )
                    else
                        return C.formatters.prettier_args
                    end
                end,
            },
            google_java_format = {
                args = C.formatters.google_java_format_args,
            },
        },
        format_on_save = C.formatters.format_on_save,
    })
end

local function null_ls_setup()
    local null_ls = require("null-ls")

    local sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.google_java_format,
    }

    local eslint_d = C.safe_require("none-ls.diagnostics.eslint_d")
    if eslint_d then
        table.insert(sources, eslint_d)
    end

    local checkstyle = C.safe_require("none-ls.diagnostics.checkstyle")
    if checkstyle then
        table.insert(sources, checkstyle)
    end

    null_ls.setup({
        sources = sources,
    })
end

return {
    -- Rust formatting
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },

    -- Prettier
    {
        "prettier/vim-prettier",
        build = "yarn install --frozen-lockfile --production",
    },

    -- Formatters
    {
        "stevearc/conform.nvim",
        config = conform_setup,
    },

    -- Linters
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvimtools/none-ls-extras.nvim",
        },
        config = null_ls_setup,
    },
}
