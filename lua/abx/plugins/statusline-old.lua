return {
    -- Ultra-minimal statusline - no external dependencies
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            -- Simple text-based statusline
            require('lualine').setup({
                -- Only use basic components to avoid dependency issues
                sections = {
                    lualine_a = {
                        {
                            -- Mode indicator
                            function()
                                return vim.fn.mode():upper():sub(1,2)
                            end,
                        },
                    },
                    
                    lualine_b = {
                        {
                            -- Git branch
                            function()
                                local git_branch = vim.b.gitsigns_head
                                return git_branch and "  " .. git_branch or ""
                            end,
                            color = { fg = "#98c379", gui = "bold" },
                        },
                    },
                    
                    lualine_c = {
                        {
                            -- File info
                            function()
                                return "%t"  -- Simple filename
                            end,
                        },
                    },
                },
                
                -- Disable complex features that might cause issues
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                },
                
                -- Use simple text formatting
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                
                always_divide_middle = false,
                
                -- Minimal color scheme - no fancy colors to avoid issues
                theme = "auto",
            })
        end,
    },
}