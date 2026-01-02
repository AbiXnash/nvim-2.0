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
            -- Go tools
            "gofumpt",        -- Go formatter
            "golangci-lint",   -- Go linter  
            "gopls",          -- Go LSP
            "delve",          -- Go debugger
            
            -- Additional language tools
            "astro-language-server", -- Astro LSP
            "svelte-language-server", -- Svelte LSP
            "typescript-language-server", -- TypeScript LSP
        }
    }
}