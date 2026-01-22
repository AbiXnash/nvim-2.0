-- File manager (oil.nvim) - configured to look like netrw
return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            columns = { "icon" },
            buf_options = {
                buflisted = true,
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
                concealcursor = "nvic",
            },
            default_file_explorer = true,
            restore_win_options = true,
            skip_confirm_for_simple_edits = true,
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
            view_options = {
                show_numbers = false,
                show_hidden = true,
            },
            float = {
                padding = 2,
                max_width = 0,
                max_height = 0,
                border = nil,
                win_options = {
                    winblend = 0,
                },
                get_win_title = nil,
                preview_split = "auto",
                override = function(conf)
                    return conf
                end,
            },
        })

        vim.keymap.set("n", "<leader>pe", "<cmd>Oil --float<CR>", { desc = "Oil file explorer(Float)" })
        vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>", { desc = "Oil file explorer" })
    end,
}
