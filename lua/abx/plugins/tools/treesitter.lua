return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            modules = {},
            ignore_install = {},

            ensure_installed = {
                "lua", "vimdoc", "java", "jsdoc",
                "python", "rust", "javascript", "typescript", "tsx",
                "json", "yaml", "toml", "css", "html", "scss",
                "go", "cpp", "c", "bash", "fish", "markdown",
                "vue", "svelte", "astro", "sql", "regex"
            },

            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                disable = function(_, buf)
                    local max_size = 100 * 1024
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

                    if ok and stats and stats.size > max_size then
                        print("File size is too big to parse using Treesitter")
                        return true
                    end
                end
            },

            -- Enable indentation with 4-space basis
            indent = {
                enable = true,
                disable = {},  -- Enable for all languages
            },

            -- Text objects based on treesitter
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
}
