-- UI plugins
return {
    -- Code completion (blink.cmp)
    { import = "abx.plugins.ui.blink" },

    -- Dashboard (start screen)
    { import = "abx.plugins.ui.dashboard" },

    -- Colorscheme (catppuccin, kanagawa)
    { import = "abx.plugins.ui.colorscheme" },

    -- Comment toggling (Comment.nvim)
    { import = "abx.plugins.ui.comments" },

    -- Code screenshots (codesnap)
    { import = "abx.plugins.ui.codesnap" },

    -- Status line (lualine)
    { import = "abx.plugins.ui.statusline" },
}
