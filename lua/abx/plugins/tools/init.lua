-- Development tools
return {
    -- Fuzzy finder (telescope)
    { import = "abx.plugins.tools.telescope" },

    -- Git integration (gitsigns, fugitive, diffview)
    { import = "abx.plugins.tools.git" },

    -- Code formatters (conform, none-ls)
    { import = "abx.plugins.tools.formatters" },

    -- LSP base plugins (lspconfig, nvim-lspconfig)
    { import = "abx.plugins.tools.lsp" },

    -- LSP package manager (mason)
    { import = "abx.plugins.tools.mason" },

    -- Session persistence (persistence)
    { import = "abx.plugins.tools.sessions" },

    -- Syntax highlighting (treesitter)
    { import = "abx.plugins.tools.treesitter" },

    -- Diagnostics panel (trouble)
    { import = "abx.plugins.tools.trouble" },

    -- Undo history (undotree)
    { import = "abx.plugins.tools.undotree" },

    -- Inline diagnostics (tiny-inline-diagnostic)
    { import = "abx.plugins.tools.inline-diagnostics" },
}
