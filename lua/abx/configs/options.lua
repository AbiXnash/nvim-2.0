-- =============================================================================
-- Editor Options Configuration
-- =============================================================================
-- Global Neovim settings using vim.opt
-- All values are centralized in abx/config.lua
-- =============================================================================

local C = require("abx.config")

-- =============================================================================
-- Key Mappings Setup
-- =============================================================================
vim.g.mapleader = C.editor.leader_key
vim.g.maplocalleader = C.editor.localleader_key

-- =============================================================================
-- Nerd Font Configuration
-- =============================================================================
vim.g.have_nerd_font = C.ui.have_nerd_font

-- =============================================================================
-- Cursor Configuration
-- =============================================================================
vim.opt.guicursor = C.editor.guicursor

-- =============================================================================
-- Line Numbers
-- =============================================================================
vim.opt.number = C.editor.number
vim.opt.relativenumber = C.editor.relativenumber

-- =============================================================================
-- Cursor Line
-- =============================================================================
vim.opt.cursorline = C.editor.cursorline
vim.opt.cursorlineopt = "number"

-- =============================================================================
-- Undo History
-- =============================================================================
vim.opt.undofile = C.editor.undofile

-- =============================================================================
-- Swap and Backup Files
-- =============================================================================
vim.opt.swapfile = C.editor.swapfile
vim.opt.backup = C.editor.backup
vim.opt.writebackup = false

-- =============================================================================
-- Search Behavior
-- =============================================================================
vim.opt.hlsearch = C.editor.hlsearch
vim.opt.incsearch = C.editor.incsearch
vim.opt.ignorecase = C.editor.ignorecase
vim.opt.smartcase = C.editor.smartcase
vim.opt.laststatus = 3
vim.opt.showmode = false

-- =============================================================================
-- Sign Column
-- =============================================================================
vim.opt.signcolumn = C.editor.signcolumn

-- =============================================================================
-- Command Preview
-- =============================================================================
vim.opt.inccommand = "split"

-- =============================================================================
-- Scrolloff
-- =============================================================================
vim.opt.scrolloff = C.editor.scrolloff

-- =============================================================================
-- Line Wrapping
-- =============================================================================
vim.opt.wrap = C.editor.wrap
vim.opt.textwidth = C.editor.textwidth

-- =============================================================================
-- Indentation
-- =============================================================================
vim.opt.tabstop = C.editor.tabstop
vim.opt.shiftwidth = C.editor.shiftwidth
vim.opt.expandtab = C.editor.expandtab
vim.opt.smartindent = C.editor.smartindent
vim.opt.softtabstop = C.editor.softtabstop

-- =============================================================================
-- Update Time
-- =============================================================================
vim.opt.updatetime = C.editor.updatetime

-- =============================================================================
-- NETRW File Explorer
-- =============================================================================
vim.g.netrw_browse_split = C.ui.netrw.browse_split
vim.g.netrw_banner = C.ui.netrw.banner
vim.g.netrw_winsize = C.ui.netrw.winsize

-- =============================================================================
-- Additional ThePrimeagen-style Tweaks
-- =============================================================================
vim.opt.mouse = ""
vim.opt.clipboard = "unnamedplus"
vim.opt.hidden = true
vim.opt.history = 1000
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = -1
vim.opt.updatetime = 50
vim.opt.redrawtime = 10000
vim.opt.conceallevel = 0
vim.opt.list = true
vim.opt.listchars = {
    tab = "│ ",
    trail = "·",
    nbsp = "␣",
    extends = "»",
    precedes = "«",
}
