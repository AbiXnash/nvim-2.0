-- Setup which-key with lazy loading
vim.defer_fn(function()
    local ok, wk = pcall(require, "which-key")
    if not ok then return end

    -- LSP key mappings
    wk.add({
        { "<leader>l", group = "LSP" },
        { "<leader>la", desc = "Code Action", mode = "n" },
        { "<leader>lf", desc = "Format Buffer", mode = "n" },
        { "<leader>lr", desc = "Rename Symbol", mode = "n" },
    })

    -- Git key mappings
    wk.add({
        { "<leader>g", desc = "Git (Fugitive)", mode = "n" },
    })

    -- File/Navigation key mappings
    wk.add({
        { "<leader>f", group = "File" },
        { "<leader>fb", desc = "Find Buffers", mode = "n" },
        { "<leader>fg", desc = "Find Git Files", mode = "n" },
        { "<leader>fs", desc = "Find String (Live Grep)", mode = "n" },
        { "<leader><leader>", desc = "Find Files", mode = "n" },
    })

    -- Code/Diagnostics key mappings
    wk.add({
        { "<leader>c", group = "Code" },
        { "<leader>ca", desc = "Code Action", mode = { "n", "v" } },
        { "<leader>cd", desc = "Show Diagnostic", mode = "n" },
        { "<leader>cl", desc = "Diagnostics to Location List", mode = "n" },
        { "<leader>cf", desc = "Format Buffer", mode = "n" },
        { "<leader>rn", desc = "Rename Symbol", mode = "n" },
    })

    -- Workspace key mappings
    wk.add({
        { "<leader>w", group = "Workspace" },
        { "<leader>wa", desc = "Add Workspace Folder", mode = "n" },
        { "<leader>wr", desc = "Remove Workspace Folder", mode = "n" },
        { "<leader>wl", desc = "List Workspace Folders", mode = "n" },
    })

    -- Diagnostic navigation
    wk.add({
        { "[d", desc = "Previous Diagnostic", mode = "n" },
        { "]d", desc = "Next Diagnostic", mode = "n" },
        { "gl", desc = "Open Diagnostic Float", mode = "n" },
    })

    -- LSP navigation
    wk.add({
        { "g", group = "Goto" },
        { "gd", desc = "Go to Definition", mode = "n" },
        { "gD", desc = "Go to Declaration", mode = "n" },
        { "gi", desc = "Go to Implementation", mode = "n" },
        { "gr", desc = "Go to References", mode = "n" },
        { "gt", desc = "Go to Type Definition", mode = "n" },
    })

    -- Documentation
    wk.add({
        { "K", desc = "Hover Documentation", mode = "n" },
        { "<C-k>", desc = "Signature Help", mode = { "n", "i" } },
        { "gs", desc = "Signature Help", mode = "n" },
    })

    -- Window navigation
    wk.add({
        { "<C-h>", desc = "Window Left", mode = "n" },
        { "<C-j>", desc = "Window Down", mode = "n" },
        { "<C-k>", desc = "Window Up", mode = "n" },
        { "<C-l>", desc = "Window Right", mode = "n" },
    })

    -- File tree
    wk.add({
        { "<leader>p", group = "Project" },
        { "<leader>pv", desc = "File Tree (Explore)", mode = "n" },
    })

    -- Special mappings
    wk.add({
        { "<leader>v", desc = "Definition in Vertical Split", mode = "n" },
        { "<leader>D", desc = "Type Definitions", mode = "n" },
        { "<leader>ds", desc = "Document Symbols", mode = "n" },
    })
end, 100)