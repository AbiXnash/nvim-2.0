return {
    html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html", "htm", "htmx" },
        settings = {
            html = {
                format = {
                    enable = true,
                    wrapLineLength = 120,
                    unformatted = "default",
                    contentUnformatted = "pre,code,textarea",
                    indentInnerHtml = true,
                    preserveNewLines = true,
                    endWithNewline = false,
                    extraLiners = "head,body,/html",
                },
                suggest = {
                    html5 = true,
                },
                validate = {
                    scripts = true,
                    styles = true,
                },
                hover = {
                    documentation = true,
                    references = true,
                },
                autoClosingTags = true,
                mirrorCursorOnMatchingTag = true,
            },
        },
        on_attach = function(client, bufnr)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, noremap = true, silent = true })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, noremap = true, silent = true })
        end,
    },
}
