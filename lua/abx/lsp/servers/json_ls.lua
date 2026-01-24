return {
    jsonls = {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        root_dir = vim.fs.root(0, {
            "package.json",
            "tsconfig.json",
            "jsconfig.json",
            ".git",
        }),
        settings = {
            json = {
                validate = { enable = true },
                schemas = require("schemastore").json.schemas(),
                hover = {
                    enable = true,
                },
                completion = {
                    enable = true,
                    awardCompletion = true,
                },
                trace = {
                    server = "off",
                },
            },
        },
        commands = {
            FormatJSON = {
                function()
                    vim.lsp.buf.format({})
                end,
                description = "Format JSON file",
            },
        },
    },
}
