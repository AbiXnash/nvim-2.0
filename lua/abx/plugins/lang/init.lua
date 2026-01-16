-- Language-specific plugins
return {
    -- Go development (gopls, neotest-go, structrue-go)
    { import = "abx.plugins.lang.go-dev" },

    -- Java development (JDTLS, dap, neotest)
    { import = "abx.plugins.lang.java" },

    -- Python development (pylsp, dap-python, venv-selector, jupytext)
    { import = "abx.plugins.lang.python" },

    -- Web development (TypeScript, Svelte, Astro)
    { import = "abx.plugins.lang.web" },

    -- Jupyter notebook integration
    { import = "abx.plugins.lang.jupytxt" },
}
