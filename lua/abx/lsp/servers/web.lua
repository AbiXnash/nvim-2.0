-- =============================================================================
-- Web Development Language Servers
-- =============================================================================
-- Consolidated configuration for web-related LSP servers
-- Updated Jan 2026: Enhanced HTMX support and schema validation
-- =============================================================================
return {
    -- HTML Language Server with formatting and auto-completion
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
    
    -- YAML Language Server with comprehensive schema validation
    -- Uses schemastore.nvim for extensive JSON schema support
    {
        "yamlls",
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yml" },
        settings = {
            yaml = { validate = true, schemaStore = { enable = true }, schemas = require("schemastore").yaml.schemas() },
        },
    },
    
    -- XML Language Server with validation and auto-tag closing
    {
        "xml",
        cmd = { "lemminx", "--stdio" },
        filetypes = { "xml", "xsl", "svg" },
        settings = { xml = { validation = { schemaValidation = "warning" }, autoCloseTags = true } },
    },
    
    -- Markdown Language Server for documentation and note-taking
    { "marksman", filetypes = { "markdown", "md" } },
    
    -- SQL Language Server with PostgreSQL dialect support
    {
        "sqlls",
        cmd = { "sql-language-server", "up", "--method", "stdio" },
        filetypes = { "sql", "mysql", "pgsql", "postgres" },
        settings = { sql = { dialect = "postgresql", format = { enabled = true } } },
    },
}
