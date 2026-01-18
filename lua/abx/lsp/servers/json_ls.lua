return {
    filetypes = { "json", "jsonc" },
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
}
