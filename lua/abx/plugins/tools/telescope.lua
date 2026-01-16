return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                layout_strategy = 'bottom_pane',
                file_ignore_patterns = { "node_modules", ".git/", "target" },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        require("telescope").load_extension("fzf")

        -- Keybindings
        vim.keymap.set("n", "<leader><leader>", function()
            require('telescope.builtin').find_files()
        end, { desc = "Find files" })

        vim.keymap.set("n", "<leader>fs", function()
            require('telescope.builtin').live_grep()
        end, { desc = "Live grep search" })

        vim.keymap.set("n", "<leader>fg", function()
            require('telescope.builtin').git_files()
        end, { desc = "Find git files" })

        vim.keymap.set("n", "<leader>fb", function()
            require('telescope.builtin').buffers()
        end, { desc = "Find buffers" })

        vim.keymap.set("n", "<leader>fd", function()
            require('telescope.builtin').diagnostics()
        end, { desc = "Find diagnostics" })

        vim.keymap.set("n", "<leader>fh", function()
            require('telescope.builtin').help_tags()
        end, { desc = "Find help tags" })

        vim.keymap.set("n", "<leader>fr", function()
            require('telescope.builtin').oldfiles()
        end, { desc = "Find recent files" })
    end,
}
