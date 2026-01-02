return {
    -- Enhanced Go development
    {
        "crusj/structr.nvim",
        ft = "go",
        config = function()
            require('structr').setup({
                -- Go struct generation options
                case_type = "camel", -- camel, snake, pascal
                filename_case_type = "snake", -- camel, snake, pascal
                auto_save = true,
            })
        end,
    },

    -- Go test runner
    {
        "nvim-neotest/neotest",
        ft = "go",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "nvim-neotest/neotest-go",
        },
        config = function()
            require('neotest').setup({
                adapters = {
                    require('neotest-go'),
                },
            })
            
            -- Go test keymaps
            vim.keymap.set('n', '<leader>gt', '<cmd>Neotest run<CR>', { desc = 'Run nearest test' })
            vim.keymap.set('n', '<leader>gT', '<cmd>Neotest run file<CR>', { desc = 'Run all tests in file' })
            vim.keymap.set('n', '<leader>gs', '<cmd>Neotest summary<CR>', { desc = 'Test summary' })
            vim.keymap.set('n', '<leader>go', '<cmd>Neotest output<CR>', { desc = 'Test output panel' })
        end,
    },
}