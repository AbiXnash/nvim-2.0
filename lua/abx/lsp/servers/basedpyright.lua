-- =============================================================================
-- Basedpyright LSP Configuration
-- =============================================================================
-- Python language server with type checking support
-- =============================================================================

local function get_root_dir(param)
    local fname

    if param == nil then
        return vim.loop.cwd()
    end

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

    local root_markers = {
        "pyrightconfig.json",
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        ".git",
    }

    local root = vim.fs.root(fname, root_markers)
    return root or vim.fs.dirname(fname)
end

return {
    basedpyright = {
        cmd = {
            vim.fn.expand("~/.local/share/pipx/venvs/basedpyright/bin/basedpyright-langserver"),
            "--stdio",
        },
        filetypes = { "python" },
        root_dir = get_root_dir,
        settings = {
            basedpyright = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    typeCheckingMode = "standard",
                    useLibraryCodeForTypes = true,
                    inlayHints = {
                        callArgumentNames = "all",
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
