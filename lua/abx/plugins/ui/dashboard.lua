-- Dashboard / Start screen (vim-startify)
return {
    "mhinz/vim-startify",
    event = "VimEnter",
    config = function()
        vim.g.startify_bookmarks = {
            { c = "~/.config/nvim" },
            { d = "~/Downloads" },
            { p = "~/projects" },
        }

        vim.g.startify_files_number = 10
        vim.g.startify_session_persistence = 1

        vim.g.startify_custom_header = {
            "   ⭐   Nvim   ⭐   ",
            "",
            "   <leader>e  - File Browser",
            "   <leader><leader>  - Find Files",
        }

        vim.g.startify_custom_footer = {
            "",
            "   Press q to exit",
        }

        vim.g.startify_change_to_vcs_root = 1
        vim.g.startify_relative_path = 1

        vim.api.nvim_create_autocmd("User", {
            pattern = "StartifyReady",
            callback = function()
                vim.keymap.set("n", "q", ":qa<CR>", { buffer = true })
            end,
        })
    end,
}
