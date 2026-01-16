return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local catppuccin = {
                normal = {
                    a = { fg = "#cdd6f4", bg = "NONE", gui = "bold" },
                    b = { fg = "#a6adc8", bg = "NONE" },
                    c = { fg = "#a6adc8", bg = "NONE" },
                },
                insert = { a = { fg = "#a6e3a1", bg = "NONE", gui = "bold" } },
                visual = { a = { fg = "#f9e2af", bg = "NONE", gui = "bold" } },
                replace = { a = { fg = "#f38ba8", bg = "NONE", gui = "bold" } },
                inactive = {
                    a = { fg = "#6c7086", bg = "NONE" },
                    b = { fg = "#6c7086", bg = "NONE" },
                    c = { fg = "#6c7086", bg = "NONE" },
                },
            }

            require("lualine").setup({
                options = {
                    theme = catppuccin,
                    globalstatus = true,
                    component_separators = "",
                    section_separators = "",
                    disabled_filetypes = {
                        statusline = { "NvimTree", "help", "qf", "Trouble", "lazy" },
                    },
                },

                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff" },
                    lualine_c = {
                        { "filename", path = 1 },
                        {
                            "lsp_progress",
                            display_components = { "lsp_client_name", "spinner" },
                            separator = { "", "" },
                        },
                    },

                    lualine_x = {
                        {
                            "diagnostics",
                            sources = { 'nvim_lsp', 'nvim_diagnostic' },
                            sections = { 'error', 'warn', 'info', 'hint' },
                            symbols = {
                                error = " ",
                                warn  = " ",
                                info  = " ",
                                hint  = "󰌵 ",
                            },
                            colored = true,
                            update_in_insert = false,
                        },
                        "filetype",
                    },
                    lualine_y = { "encoding", "fileformat" },
                    lualine_z = { "location", "progress" },
                },

                inactive_sections = {
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = { "filetype" },
                },

                tabline = {
                    lualine_a = { "tabs" },
                    lualine_b = { "buffers" },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { "hostname" },
                },
            })
        end,
    },
}
