return {
    tailwindcss = {
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = {
            "html",
            "htmx",
            "css",
            "scss",
            "less",
            "svelte",
            "typescriptreact",
            "javascriptreact",
            "vue",
            "astro",
        },
        settings = {
            tailwindcss = {
                validate = true,
                experimental = {
                    classRegex = {
                        { "tw`([^`]*)`" },
                        { 'tw="([^"]*)"' },
                        { "tw=\\{([^}]*)\\}" },
                        { 'tw\\.([a-zA-Z0-9_]+)' },
                        { 'class:\\s*["\']([^"\']+)["\']' },
                        { 'className:\\s*["\']([^"\']+)["\']' },
                    },
                },
                trace = {
                    server = "off",
                },
                includeLanguages = {
                    html = "html",
                    htmx = "html",
                    svelte = "html",
                    astro = "html",
                },
                ignoreDefinitions = {
                    -- Ignore tailwind classes in strings/templates
                    true,
                },
            },
        },
        on_attach = function(client, bufnr)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, noremap = true, silent = true })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, noremap = true, silent = true })
            vim.keymap.set("n", "<leader>tc", ":TailwindCSSConvertComponent<CR>", { buffer = bufnr, noremap = true })
        end,
    },
}
