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
vim.opt.cursorlineopt = C.editor.cursorlineopt

-- =============================================================================
-- Undo History
-- =============================================================================
vim.opt.undofile = C.editor.undofile

-- =============================================================================
-- Swap and Backup Files
-- =============================================================================
vim.opt.swapfile = C.editor.swapfile
vim.opt.backup = C.editor.backup
vim.opt.writebackup = C.editor.writebackup

-- =============================================================================
-- Search Behavior
-- =============================================================================
vim.opt.hlsearch = C.editor.hlsearch
vim.opt.incsearch = C.editor.incsearch
vim.opt.ignorecase = C.editor.ignorecase
vim.opt.smartcase = C.editor.smartcase
vim.opt.laststatus = C.editor.laststatus
vim.opt.showmode = C.editor.showmode

-- =============================================================================
-- Sign Column
-- =============================================================================
vim.opt.signcolumn = C.editor.signcolumn

-- =============================================================================
-- Command Preview
-- =============================================================================
vim.opt.inccommand = C.editor.inccommand

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
-- Additional Preferences (from centralized config)
-- =============================================================================
vim.opt.mouse = C.editor.mouse
vim.opt.clipboard = C.editor.clipboard
vim.opt.hidden = C.editor.hidden
vim.opt.history = C.editor.history
vim.opt.wildmenu = C.editor.wildmenu
vim.opt.wildmode = C.editor.wildmode
vim.opt.splitright = C.editor.splitright
vim.opt.splitbelow = C.editor.splitbelow
vim.opt.termguicolors = C.editor.termguicolors
vim.opt.timeoutlen = C.editor.timeoutlen
vim.opt.ttimeoutlen = C.editor.ttimeoutlen
vim.opt.redrawtime = C.editor.redrawtime
vim.opt.conceallevel = C.editor.conceallevel
vim.opt.listchars = C.editor.listchars
vim.opt.list = C.editor.list

vim.lsp.handlers["textDocument/documentHighlight"] = function() end
