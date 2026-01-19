-- File manager (oil.nvim)
return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            columns = { "icon" },
            buf_options = {
                buflisted = false,
                bufhidden = "hide",
            },
            win_options = {
                wrap = false,
                signcolumn = "no",
                cursorcolumn = false,
                foldcolumn = "0",
                spell = false,
                list = false,
                conceallevel = 3,
                concealcursor = "n",
            },
            default_file_explorer = true,
            restore_win_options = true,
            skip_confirm_for_simple_edits = false,
            watch_for_changes = false,
            popup_border = "single",
            cleanup_delay_ms = 2000,
            lsp_file_methods = {
                enabled = true,
                timeout_ms = 1000,
            },
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = "actions.select_vsplit",
                ["<C-h>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["//"] = "actions.toggle_trash",
            },
        })

        vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Oil file explorer" })
        vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>", { desc = "Oil file explorer" })
    end,
}
