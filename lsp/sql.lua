return {
    sqlls = {
        cmd = { "sql-language-server", "up", "--method", "stdio" },
        filetypes = { "sql", "mysql", "pgsql", "postgres" },
        root_markers = { "*.sql", ".sqlfluff", ".sqlformat", ".git" },
        settings = {
            sql = {
                dialect = "postgresql",
                format = {
                    enabled = true,
                },
                analyze = {
                    enabled = true,
                },
            },
        },
        on_attach = function(client, bufnr)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, noremap = true, silent = true })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, noremap = true, silent = true })
        end,
    },
}
