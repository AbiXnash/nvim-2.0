local util = vim.fs

return {
    pylsp = {
        cmd = { "pylsp" },
        filetypes = { "python" },

        root_markers = {
            "pyproject.toml",
            "setup.py",
            "setup.cfg",
            "requirements.txt",
            "Pipfile",
            ".git",
        },

        root_dir = function(bufnr)
            bufnr = bufnr or vim.api.nvim_get_current_buf()
            local fname = vim.api.nvim_buf_get_name(bufnr)

            if fname == nil or fname == "" then
                return vim.loop.cwd()
            end

            local path = util.dirname(fname)
            local root = util.root(path, {
                "pyproject.toml",
                "setup.py",
                "setup.cfg",
                "requirements.txt",
                "Pipfile",
                ".git",
            })

            return root or path
        end,

        settings = {
            pylsp = {
                plugins = {
                    jedi_completion = { enabled = true, fuzzy = true },
                    jedi_hover = { enabled = true },
                    jedi_signature_help = { enabled = true },

                    pyflakes = { enabled = true },
                    mccabe = { enabled = true },
                    pycodestyle = { enabled = false },

                    rope_autoimport = { enabled = true },

                    yapf = { enabled = true },
                },
            },
        },
    }
}
