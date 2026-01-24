return {
    {
        "html",
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html", "htm" },
        settings = {
            html = {
                format = { enable = true, wrapLineLength = 120 },
                suggest = { html5 = true },
                autoClosingTags = true,
            },
        },
    },
    { "htmx",     cmd = { "htmx-lsp", "--stdio" }, filetypes = { "htmx", "html" } },
    {
        "yamlls",
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yml" },
        settings = {
            yaml = { validate = true, schemaStore = { enable = true }, schemas = require("schemastore").yaml.schemas() },
        },
    },
    {
        "xml",
        cmd = { "lemminx", "--stdio" },
        filetypes = { "xml", "xsl", "svg" },
        settings = { xml = { validation = { schemaValidation = "warning" }, autoCloseTags = true } },
    },
    { "marksman", filetypes = { "markdown", "md" } },
    {
        "sqlls",
        cmd = { "sql-language-server", "up", "--method", "stdio" },
        filetypes = { "sql", "mysql", "pgsql", "postgres" },
        settings = { sql = { dialect = "postgresql", format = { enabled = true } } },
    },
}
