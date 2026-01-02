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
            },
            file_ignore_patterns = { "node_modules", ".git/", "target" },
        })

        -- Find Files from parent directory
        vim.keymap.set("n", "<leader><leader>", function()
            require('telescope.builtin').find_files()
        end)

        -- Find words from parent directory
        vim.keymap.set("n", "<leader>fs", function()
            require('telescope.builtin').live_grep()
        end)

        -- Find git files
        vim.keymap.set("n", "<leader>fg", function()
            require('telescope.builtin').git_files()
        end)

        -- Find by current buffers
        vim.keymap.set("n", "<leader>fb", function()
            require('telescope.builtin').buffers()
        end)

        
    end



}
