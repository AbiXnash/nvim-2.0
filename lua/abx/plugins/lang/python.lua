return {
    { "Vimjas/vim-python-pep8-indent" },

    -- Virtual environment selector
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "mfussenegger/nvim-dap" },
        opts = {
            name = { "venv", ".venv", ".env" },
            auto_reload = true,
        },
        event = "VeryLazy",
    },

    -- Jupyter notebook integration
    {
        "GCBallesteros/jupytext.nvim",
        opts = {
            custom_language_formatting = { python = { extension = "py", style = "percent" } },
        },
    },
    { "goerz/jupytext.vim", lazy = false },

    -- Python debugging
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

            -- Try multiple Python paths for flexibility
            local python_paths = {
                os.getenv("CONDA_PREFIX") and (os.getenv("CONDA_PREFIX") .. "/bin/python") or nil,
                os.getenv("VIRTUAL_ENV") and (os.getenv("VIRTUAL_ENV") .. "/bin/python") or nil,
                "python3",
                "python",
            }

            local found = false
            for _, path in ipairs(python_paths) do
                if path and vim.fn.executable(path) == 1 then
                    dap_python.setup(path)
                    found = true
                    break
                end
            end

            if not found then
                dap_python.setup("python3")
            end

            dap_python.test_runner = "pytest"
        end,
    },
}
