local C = require("abx.config")

return {
    { "L3MON4D3/LuaSnip", keys = {} },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        version = "*",
        config = function()
            local blink = require("blink.cmp")

            blink.setup({
                snippets = {
                    preset = "luasnip",
                },
                signature = {
                    enabled = true,
                },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "normal",
                },
                sources = {
                    default = { "lazydev", "lsp", "path", "snippets" },
                    providers = {
                        lazydev = {
                            name = "LazyDev",
                            module = "lazydev.integrations.blink",
                            score_offset = 100,
                        },
                    },
                },
                keymap = {
                    ["<CR>"] = { "accept", "fallback" },
                    ["<Tab>"] = { "select_next", "fallback" },
                    ["<S-Tab>"] = { "select_prev", "fallback" },
                },
                cmdline = {
                    enabled = false,
                    completion = {
                        menu = {
                            auto_show = true,
                        },
                    },
                    keymap = {
                        ["<CR>"] = { "accept", "fallback" },
                    },
                },
                completion = {
                    menu = {
                        auto_show = C.ui.blink.auto_show,
                        border = "single",
                        scrolloff = C.ui.blink.scrolloff,
                        scrollbar = false,
                    },
                    documentation = {
                        window = {
                            border = "single",
                            scrollbar = false,
                        },
                        auto_show = C.ui.blink.auto_show,
                        auto_show_delay_ms = C.ui.blink.auto_show_delay_ms,
                    },
                },
            })

            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
