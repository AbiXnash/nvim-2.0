return {
    "mason-org/mason.nvim",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
        ensure_installed = {
            -- Go
            "gopls",
            "gofumpt",
            "golangci-lint",
            "delve",

            -- Web (TypeScript/JavaScript/HTML/CSS/YAML/JSON)
            "typescript-language-server",
            "prettierd",
            "eslint_d",
            "html-lsp",
            "yaml-language-server",
            "json-lsp",
            "tailwindcss-language-server",
            "htmx-lsp",

            -- Frameworks
            "svelte-language-server",
            "astro-language-server",

            -- Python
            "basedpyright",
            "black",
            "debugpy",

            -- Lua
            "lua-language-server",
            "stylua",

            -- Rust
            "rust-analyzer",
            "rustfmt",

            -- Java
            "jdtls",
            "java-test",
            "java-debug-adapter",
            "google-java-format",
            "checkstyle",

            -- Kotlin
            "kotlin-language-server",
            "ktlint",

            -- Other
            "sql-language-server",
            "markdownlint",
            "marksman",
            "shellcheck",
            "shfmt",
            "lemminx",
        }
    }
}
