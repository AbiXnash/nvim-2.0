return {
    { 'brenoprata10/nvim-highlight-colors', opts = {} },

    { "b0o/schemastore.nvim" },

    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        config = true,
    },



    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "html",
                "css",
                "scss",
                "less",
                "javascript",
                "typescript",
                "tsx",
                "xml",
                "xsl",
                "svg",
                "tmpl",
                "sql",
                "kotlin",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        },
    },

    {
        "mrshmllow/document-color.nvim",
        ft = { "css", "scss", "less", "html" },
        opts = {
            mode = "foreground",
        },
    },

    {
        "c0r73x/neotags.lua",
        ft = { "html", "css", "javascript", "typescript" },
        opts = {
            update = true,
            current_buffer_only = false,
        },
    },
}
