return {
    -- Enhanced Go development with syntax highlighting and LSP
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = function()
            local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    require('go.format').goimports()
                end,
                group = format_sync_grp,
            })
            return {
                -- lsp_keymaps = false, -- Comment out to use your existing LSP keymaps
            }
        end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()'
    },

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