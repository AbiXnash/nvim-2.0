-- =============================================================================
-- ABX Plugins Configuration
-- =============================================================================
-- This file imports all plugin specifications organized by category.
-- Each category is in its own subdirectory with individual plugin files.
-- =============================================================================

return {
    -- =============================================================================
    -- Language-specific plugins (Go, Python, Java, Web, Jupyter)
    -- =============================================================================
    { import = "abx.plugins.lang" },

    -- =============================================================================
    -- User interface plugins (completion, themes, comments, statusline)
    -- =============================================================================
    { import = "abx.plugins.ui" },

    -- =============================================================================
    -- Development tools (telescope, git, formatters, LSP, mason, etc.)
    -- =============================================================================
    { import = "abx.plugins.tools" },
}
