return {
    { "Vimjas/vim-python-pep8-indent" },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "mfussenegger/nvim-dap" },
        opts = { name = { "venv", ".venv" } },
        event = "VeryLazy",
    },

    {
        "GCBallesteros/jupytext.nvim",
        opts = { custom_language_formatting = { python = { extension = "py", style = "percent" } } },
    },
    { "goerz/jupytext.vim",           lazy = false }, -- fallback

    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap_python = require("dap-python")
            dap_python.setup("~/miniconda3/bin/python") -- or python3 -m debugpy
            dap_python.test_runner = "pytest"
        end,
    },
}
