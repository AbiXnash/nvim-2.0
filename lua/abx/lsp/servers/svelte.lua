return {
    svelte = {
        cmd = { "svelteserver", "--stdio" },
        filetypes = { "svelte" },
        root_dir = function(fname)
            local util = require('lspconfig.util')
            return util.root_pattern('package.json', 'svelte.config.js', '.git')(fname)
        end,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
        on_attach = function(client, bufnr)
            -- Your original on_attach logic
            if client.name == "svelte" then
                vim.api.nvim_create_autocmd("BufWritePost", {
                    pattern = { "*.js", "*.ts", "*.svelte" },
                    callback = function(ctx)
                        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
                    end,
                })
            end
        end,
        settings = {
            svelte = {
                plugin = {
                    html = { enable = true },
                    css = { enable = true },
                    typescript = { enable = true },
                    svelte = { enable = true },
                },
            },
        },
    },
}
