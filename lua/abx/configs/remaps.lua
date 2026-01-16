-- =============================================================================
-- Key Mappings Configuration
-- =============================================================================
-- Custom keybindings for improved workflow
-- All mappings use <leader> (space) as prefix
-- =============================================================================

-- =============================================================================
-- Escape Mappings
-- =============================================================================
-- Quick ways to exit modes or clear search
-- =============================================================================

-- <Esc> to clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {
    desc = "Clear search highlight"
})

-- jk to exit insert mode (faster than reaching for Esc)
vim.keymap.set("i", "jk", "<Esc>", {
    noremap = true,
    silent = true,
    desc = "Exit insert mode"
})

-- =============================================================================
-- Line Movement
-- =============================================================================
-- Move lines up/down in visual mode with proper indentation
-- =============================================================================

-- Move selected line(s) down
vim.keymap.set("v", ",", ":m '>+1<CR>gv=gv", {
    desc = "Move line down"
})

-- Move selected line(s) up
vim.keymap.set("v", ".", ":m '<-2<CR>gv=gv", {
    desc = "Move line up"
})

-- =============================================================================
-- Centered Scrolling
-- =============================================================================
-- Keep cursor centered when scrolling through search results or pages
-- =============================================================================

-- Page down and center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz", {
    desc = "Page down and center"
})

-- Page up and center cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz", {
    desc = "Page up and center"
})

-- Next search result and center
vim.keymap.set("n", "n", "nzzzv", {
    desc = "Next search result and center"
})

-- Previous search result and center
vim.keymap.set("n", "N", "Nzzzv", {
    desc = "Previous search result and center"
})

-- =============================================================================
-- Window Navigation
-- =============================================================================
-- Navigate between windows with Ctrl + arrow keys
-- =============================================================================

-- Window left
vim.keymap.set("n", "<C-h>", "<C-w>h")

-- Window right
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Window down
vim.keymap.set("n", "<C-j>", "<C-w>j")

-- Window up
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- =============================================================================
-- System Clipboard
-- =============================================================================
-- Copy to system clipboard from visual mode
-- =============================================================================

-- Copy to system clipboard (works across applications)
vim.keymap.set("v", "<C-c>", '"+y', {
    desc = "Copy to system clipboard"
})

-- =============================================================================
-- File Explorer (NETRW)
-- =============================================================================
-- File tree and split navigation
-- =============================================================================

-- Open file tree
vim.keymap.set("n", "<leader>pv", "<cmd>Explore<CR>", {
    desc = "File tree"
})

-- Split explore above
vim.keymap.set("n", "<C-up>", "<cmd>Sexplore<CR>", {
    desc = "Split explore above"
})

-- Horizontal explore below
vim.keymap.set("n", "<C-down>", "<cmd>Hexplore<CR>", {
    desc = "Horizontal explore below"
})

-- Vertical explore left
vim.keymap.set("n", "<C-left>", "<cmd>Vexplore<CR>", {
    desc = "Vertical explore left"
})

-- =============================================================================
-- Git Integration
-- =============================================================================
-- Quick access to git status via Fugitive
-- =============================================================================

-- Show git status
vim.keymap.set("n", "<leader>g", "<cmd>G<CR>", {
    desc = "Git status (Fugitive)"
})
