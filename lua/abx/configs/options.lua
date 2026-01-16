-- =============================================================================
-- Editor Options Configuration
-- =============================================================================
-- Global Neovim settings using vim.opt
-- These settings control the core editor behavior
-- =============================================================================

-- =============================================================================
-- Key Mappings Setup
-- =============================================================================
-- Define leader keys for keybindings
-- <Space> is the main leader key for custom mappings
-- =============================================================================
vim.g.mapleader = " "           -- Main leader key
vim.g.maplocalleader = " "      -- Local leader for file-type specific mappings

-- =============================================================================
-- Nerd Font Configuration
-- =============================================================================
-- Enable Nerd Font icons for plugins and UI elements
-- =============================================================================
vim.g.have_nerd_font = true     -- Required for plugin icons to display

-- =============================================================================
-- Cursor Configuration
-- =============================================================================
-- Configure cursor appearance in different modes
-- Empty string = use terminal cursor
-- =============================================================================
vim.opt.guicursor = ""          -- Use terminal cursor settings

-- =============================================================================
-- Line Numbers
-- =============================================================================
-- Enable absolute line numbers with relative numbering for motion
-- =============================================================================
vim.opt.number = true           -- Show absolute line numbers
vim.opt.relativenumber = true   -- Show relative line numbers for easier jumps

-- =============================================================================
-- Cursor Line
-- =============================================================================
-- Highlight the current line for better visibility
-- =============================================================================
vim.opt.cursorline = true       -- Highlight current line

-- =============================================================================
-- Undo History
-- =============================================================================
-- Enable persistent undo history across sessions
-- Files are stored in ~/.local/share/nvim/undo/
-- =============================================================================
vim.opt.undofile = true         -- Persist undo history

-- =============================================================================
-- Swap and Backup Files
-- =============================================================================
-- Disable swap files and backups for cleaner workflow
-- =============================================================================
vim.opt.swapfile = false        -- No swap files
vim.opt.backup = false          -- No backup files

-- =============================================================================
-- Search Behavior
-- =============================================================================
-- Configure search highlighting and incremental search
-- =============================================================================
vim.opt.hlsearch = true         -- Highlight search results
vim.opt.incsearch = true        -- Incremental search as you type
vim.opt.ignorecase = true       -- Ignore case in searches
vim.opt.smartcase = true        -- Smart case (ignore case if all lowercase)

-- =============================================================================
-- Sign Column
-- =============================================================================
-- Always show sign column (for LSP diagnostics, git signs, etc.)
-- =============================================================================
vim.opt.signcolumn = "yes"      -- Always show sign column

-- =============================================================================
-- Command Preview
-- =============================================================================
-- Show command substitutions in real-time
-- =============================================================================
vim.opt.inccommand = "split"    -- Show :s substitutions in split

-- =============================================================================
-- Scrolloff
-- =============================================================================
-- Keep context visible when scrolling
-- =============================================================================
vim.opt.scrolloff = 20          -- Keep 20 lines visible above/below

-- =============================================================================
-- Line Wrapping
-- =============================================================================
-- Disable automatic line wrapping for cleaner code editing
-- =============================================================================
vim.opt.wrap = false            -- No wrap (horizontal scroll)
vim.opt.textwidth = 0           -- No auto-wrap at specific width

-- =============================================================================
-- Indentation
-- =============================================================================
-- Configure tab and indentation behavior
-- Uses 4 spaces for all languages
-- =============================================================================
vim.opt.tabstop = 4             -- Tab width = 4 spaces
vim.opt.shiftwidth = 4          -- Indent/deindent = 4 spaces
vim.opt.expandtab = true        -- Expand tabs to spaces
vim.opt.smartindent = true      -- Smart auto-indent
vim.opt.softtabstop = 4         -- Backspace deletes 4 spaces

-- =============================================================================
-- Update Time
-- =============================================================================
-- Faster updates for better responsiveness
-- =============================================================================
vim.opt.updatetime = 10         -- ms delay before triggering events

-- =============================================================================
-- NETRW File Explorer
-- =============================================================================
-- Configure built-in file explorer behavior
-- =============================================================================
vim.g.netrw_browse_split = 0    -- Open in same window
vim.g.netrw_banner = 0          -- Hide banner
vim.g.netrw_winsize = 25        -- Default width = 25%

-- =============================================================================
-- Filetype Detection (Neovim default is enabled)
-- =============================================================================
-- Note: filetype detection is enabled by default in Neovim
-- vim.g.filetype_detect = true   -- Uncomment to enable (default)
-- vim.g.filetype_plugin = true   -- Uncomment to enable filetype plugins
-- vim.g.filetype_indent = true   -- Uncomment to enable filetype indentation
