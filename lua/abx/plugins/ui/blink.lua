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
                    window = {
                        border = "single",
                        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
                    },
                },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "normal",
                    kind_icons = {
                        Text = "T",
                        Method = "M",
                        Function = "F",
                        Constructor = "C",
                        Variable = "V",
                        Class = "C",
                        Interface = "I",
                        Module = "M",
                        Property = "P",
                        Unit = "U",
                        Value = "V",
                        Enum = "E",
                        Keyword = "K",
                        Snippet = "S",
                        Color = "C",
                        File = "F",
                        Reference = "R",
                        Folder = "D",
                        EnumMember = "E",
                        Constant = "C",
                        Struct = "S",
                        Event = "E",
                        Operator = "O",
                        TypeParameter = "T",
                    },
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
                    ["<C-n>"] = { "select_next", "fallback" },
                    ["<C-p>"] = { "select_prev", "fallback" },
                    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
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
                        draw = {
                            components = {
                                kind_icon = {
                                    width = 1,
                                    padding = { left = 0, right = 1 },
                                },
                                label = {
                                    width = { max = 40 },
                                    text = function(item)
                                        return item.label .. (item.label_description and (" " .. item.label_description) or "")
                                    end,
                                    match = function(item, context)
                                        return item.label:lower():find(context.input:lower(), 1, true) or item.label_description:lower():find(context.input:lower(), 1, true)
                                    end,
                                },
                            },
                        },
                    },
                    documentation = {
                        window = {
                            border = "single",
                            scrollbar = false,
                            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
                        },
                        auto_show = C.ui.blink.auto_show,
                        auto_show_delay_ms = C.ui.blink.auto_show_delay_ms,
                    },
                    list = {
                        selection = { preselect = false, auto_insert = true },
                    },
                },
            })

            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
