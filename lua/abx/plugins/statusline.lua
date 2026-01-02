return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local transparent_premium = {
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
                    theme = transparent_premium,
                    globalstatus = true,
                    component_separators = "",
                    section_separators = "",
                    disabled_filetypes = {
                        statusline = { "NvimTree", "help", "qf", "Trouble" },
                    },
                },

                sections = {
                    -- LEFT (quiet, flowing)
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = { "filename" },

                    -- RIGHT (signals only)
                    lualine_x = {
                        {
                            "diagnostics",
                            sources = { 'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp' },
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
                    },
                    lualine_y = { "filetype" },
                    lualine_z = { "location" },
                },

                inactive_sections = {
                    lualine_c = { "filename" },
                },
            })
        end,
    },
}
