return {
    {
        "mfussenegger/nvim-dap",
        ft = "java",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            vim.keymap.set('n', '<leader>dc', '<cmd>DapContinue<CR>', { desc = 'Continue debugging' })
            vim.keymap.set('n', '<leader>dr', '<cmd>DapToggleRepl<CR>', { desc = 'Toggle REPL' })
            vim.keymap.set('n', '<leader>dk', '<cmd>DapTerminate<CR>', { desc = 'Terminate debug' })
            vim.keymap.set('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>', { desc = 'Toggle breakpoint' })
            vim.keymap.set('n', '<leader>dB', '<cmd>DapBreakpointCondition<CR>', { desc = 'Breakpoint condition' })
            vim.keymap.set('n', '<leader>ds', '<cmd>DapStepOver<CR>', { desc = 'Step over' })
            vim.keymap.set('n', '<leader>di', '<cmd>DapStepInto<CR>', { desc = 'Step into' })
            vim.keymap.set('n', '<leader>do', '<cmd>DapStepOut<CR>', { desc = 'Step out' })
        end,
    },

    {
        "nvim-neotest/neotest",
        ft = "java",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require('neotest').setup({
                adapters = {},
            })

            vim.keymap.set('n', '<leader>jt', '<cmd>Neotest run<CR>', { desc = 'Run nearest test' })
            vim.keymap.set('n', '<leader>jT', '<cmd>Neotest run file<CR>', { desc = 'Run all tests in file' })
            vim.keymap.set('n', '<leader>js', '<cmd>Neotest summary<CR>', { desc = 'Test summary' })
            vim.keymap.set('n', '<leader>jo', '<cmd>Neotest output<CR>', { desc = 'Test output panel' })
        end,
    },
}
