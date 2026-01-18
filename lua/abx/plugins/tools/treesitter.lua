-- =============================================================================
-- Treesitter Configuration
-- =============================================================================
-- Syntax highlighting and text objects
-- =============================================================================

local C = require("abx.config")

local function treesitter_setup()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
        modules = {},
        ignore_install = {},

        ensure_installed = C.treesitter.ensure_installed,

        sync_install = false,
        auto_install = true,

        highlight = {
            enable = true,
            disable = function(_, buf)
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > C.treesitter.max_file_size then
                    vim.notify("File too large for Treesitter highlighting", vim.log.levels.WARN)
                    return true
                end
            end,
        },

        indent = {
            enable = true,
            disable = {},
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
        },

        additional_vim_regex_highlighting = false,
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = treesitter_setup,
}
