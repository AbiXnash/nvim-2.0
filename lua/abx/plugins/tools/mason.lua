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

            -- Web (TypeScript/JavaScript)
            "typescript-language-server",
            "prettierd",
            "eslint_d",

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

            -- Other
            "json-lsp",
            "yaml-language-server",
            "markdownlint",
            "shellcheck",
            "shfmt",
        }
    }
}
