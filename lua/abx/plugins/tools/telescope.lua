-- =============================================================================
-- Telescope Configuration
-- =============================================================================
-- Fuzzy finder with fzf integration
-- =============================================================================

local C = require("abx.config")

local function telescope_setup()
    local telescope = require("telescope")

    telescope.setup({
        defaults = {
            layout_strategy = C.telescope.layout_strategy,
            file_ignore_patterns = C.telescope.ignore_patterns,
            path_display = { "smart" },
            sorting_strategy = "ascending",
            winblend = 0,
            border = true,
            previewer = true,
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
            file_browser = {
                theme = "ivy",
                hijack_netrw = false,
            },
        },
    })

    local fzf = C.safe_require("telescope-fzf-native")
    if fzf then
        telescope.load_extension("fzf")
    end

    telescope.load_extension("file_browser")
end

local function setup_keymaps()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Live grep search" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git files" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent files" })

    vim.keymap.set("n", "<leader>e", function()
    require("telescope").extensions.file_browser.file_browser()
end, { desc = "File browser" })
end

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        telescope_setup()
        setup_keymaps()
    end,
}
