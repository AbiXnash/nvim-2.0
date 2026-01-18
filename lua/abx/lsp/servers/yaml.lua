return {
    yaml = {
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yml" },
        settings = {
            yaml = {
                validate = true,
                schemaStore = {
                    enable = true,
                },
                schemas = require("schemastore").yaml.schemas(),
                format = {
                    enable = true,
                },
                hover = true,
                completion = true,
            },
        },
    },
}
