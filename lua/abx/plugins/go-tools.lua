return {
    -- Enhanced Go development
    {
        "s1n7/structgen.nvim",
        ft = "go",
        config = function()
            require("structgen").setup({
                -- Go struct generation options
                case_type = "camel", -- camel, snake, pascal
                filename_case_type = "snake", -- camel, snake, pascal
                auto_save = true,
            })
        end,
    },
}