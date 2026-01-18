return {
    xml = {
        cmd = { "lemminx", "--stdio" },
        filetypes = { "xml", "xsl", "svg", "pom", "xjb", "jelly" },
        settings = {
            xml = {
                validation = {
                    schemaValidation = "warning",
                },
                format = {
                    enabled = true,
                },
                autoCloseTags = true,
            },
        },
    },
}
