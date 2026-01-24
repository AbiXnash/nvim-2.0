return {
    -- Enhanced Go struct handling
    {
        "crusj/structrue-go.nvim",
        ft = "go",
    },

    -- Go test runner with neotest
    {
        "nvim-neotest/neotest",
        ft = "go",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "nvim-neotest/neotest-go",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-go"),
                },
            })

            -- Go test keymaps
            vim.keymap.set("n", "<leader>gt", "<cmd>Neotest run<CR>", { desc = "Run nearest test" })
            vim.keymap.set("n", "<leader>gT", "<cmd>Neotest run file<CR>", { desc = "Run all tests in file" })
            vim.keymap.set("n", "<leader>gs", "<cmd>Neotest summary<CR>", { desc = "Test summary" })
            vim.keymap.set("n", "<leader>go", "<cmd>Neotest output<CR>", { desc = "Test output panel" })
            vim.keymap.set("n", "<leader>gf", "<cmd>Neotest run functions<CR>", { desc = "Run test function" })
        end,
    },
}