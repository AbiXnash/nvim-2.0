-- ~/.config/nvim/lua/lsp/basedpyright.lua
local util = vim.fs

return {
    basedpyright = {
        -- Adjust this path if your pipx or installation used a different location
        cmd = {
            vim.fn.expand("~/.local/share/pipx/venvs/basedpyright/bin/basedpyright-langserver"),
            "--stdio",
        },

        filetypes = { "python" },

        root_markers = {
            "pyrightconfig.json",
            "pyproject.toml",
            "setup.py",
            "setup.cfg",
            "requirements.txt",
            "Pipfile",
            ".git",
        },

        -- Robust root_dir that supports nil, table(param.buf), number (bufnr), or string
        root_dir = function(param)
            -- fallback if param is nil
            if param == nil then
                return vim.loop.cwd()
            end

            local fname

            if type(param) == "table" and param.buf then
                fname = vim.api.nvim_buf_get_name(param.buf)
            elseif type(param) == "number" then
                fname = vim.api.nvim_buf_get_name(param)
            elseif type(param) == "string" then
                fname = param
            else
                return vim.loop.cwd()
            end

            if not fname or fname == "" then
                return vim.loop.cwd()
            end

            local root = util.root(fname, {
                "pyrightconfig.json",
                "pyproject.toml",
                "setup.py",
                "setup.cfg",
                "requirements.txt",
                "Pipfile",
                ".git",
            })

            return root or util.dirname(fname)
        end,

        settings = {
            basedpyright = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    typeCheckingMode = "standard",
                    useLibraryCodeForTypes = true,

                    -- Inlay hints configuration
                    inlayHints = {
                        callArgumentNames = "all", -- "all" | "partial" | "off"
                        callArgumentTypes = true,
                        functionParameterTypes = true,
                        functionReturnTypes = true,
                        variableTypes = true,
                        propertyDeclarationTypes = true,
                        genericTypes = true,
                        pytestParameters = true,
                    },
                },
            },
        },
    },
}
