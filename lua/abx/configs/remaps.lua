-- =============================================================================
-- Key Mappings Configuration
-- =============================================================================
-- All mappings use <leader> (space) as prefix
-- Mappings are organized by functional category
-- =============================================================================

local C = require("abx.config")

local function map(mode, lhs, rhs, opts)
    local default_opts = { noremap = true, silent = true }
    vim.keymap.set(mode, lhs, rhs, vim.tbl_deep_extend("force", default_opts, opts or {}))
end

local function nmap(lhs, rhs, opts)
    map("n", lhs, rhs, opts)
end

local function imap(lhs, rhs, opts)
    map("i", lhs, rhs, opts)
end

local function vmap(lhs, rhs, opts)
    map("v", lhs, rhs, opts)
end

-- =============================================================================
-- Escape Mappings
-- =============================================================================
nmap("<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
imap("jk", "<Esc>", { desc = "Exit insert mode" })
imap("kj", "<Esc>", { desc = "Exit insert mode (alt)" })

-- =============================================================================
-- Line Movement (Visual Mode)
-- =============================================================================
vmap(",", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vmap(".", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- =============================================================================
-- Centered Scrolling
-- =============================================================================
nmap(C.keymaps.scroll_center.page_down, "<C-d>zz", { desc = "Page down and center" })
nmap(C.keymaps.scroll_center.page_up, "<C-u>zz", { desc = "Page up and center" })
nmap("n", "nzzzv", { desc = "Next search result and center" })
nmap("N", "Nzzzv", { desc = "Previous search result and center" })

-- =============================================================================
-- Window Navigation
-- =============================================================================
nmap(C.keymaps.window_nav.left, "<C-w>h", { desc = "Window left" })
nmap(C.keymaps.window_nav.right, "<C-w>l", { desc = "Window right" })
nmap(C.keymaps.window_nav.down, "<C-w>j", { desc = "Window down" })
nmap(C.keymaps.window_nav.up, "<C-w>k", { desc = "Window up" })

-- =============================================================================
-- System Clipboard
-- =============================================================================
vmap("<C-c>", '"+y', { desc = "Copy to system clipboard" })

-- =============================================================================
-- File Explorer (NETRW)
-- =============================================================================
nmap("<leader>pv", "<cmd>Explore<CR>", { desc = "File tree" })

-- =============================================================================
-- Git Integration
-- =============================================================================
nmap("<leader>g", "<cmd>G<CR>", { desc = "Git status (Fugitive)" })
