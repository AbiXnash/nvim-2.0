return {
    kotlin_language_server = {
        cmd = { "kotlin-language-server" },
        filetypes = { "kotlin" },
        root_markers = { "build.gradle.kts", "settings.gradle.kts", "pom.xml", ".git" },
        settings = {
            kotlin = {
                compiler = {
                    jvm = {
                        target = "JVM_17",
                    },
                },
                codeStyle = {
                    name = "IntelliJ",
                },
            },
        },
        on_attach = function(client, bufnr)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, noremap = true, silent = true })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, noremap = true, silent = true })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, noremap = true, silent = true })
        end,
    },
}
