-- =============================================================================
-- ABX Configuration - Centralized Settings
-- =============================================================================
-- All hardcoded values should be defined here for easy modification
-- =============================================================================

local Config = {}

-- =============================================================================
-- Editor Behavior
-- =============================================================================
Config.editor = {
    -- Leader keys
    leader_key = " ",
    localleader_key = " ",

    -- Line numbers
    number = true,
    relativenumber = true,

    -- Cursor
    cursorline = true,
    guicursor = "",

    -- Search
    hlsearch = true,
    incsearch = true,
    ignorecase = true,
    smartcase = true,

    -- UI
    signcolumn = "yes",
    scrolloff = 20,
    updatetime = 10,

    -- Indentation
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true,

    -- Wrapping
    wrap = false,
    textwidth = 0,

    -- Files
    undofile = true,
    swapfile = false,
    backup = false,
}

-- =============================================================================
-- LSP Configuration
-- =============================================================================
Config.lsp = {
    -- Format timeout (ms)
    format_timeout = 4000,

    -- Diagnostic settings
    diagnostics = {
        signs = true,
        severity_sort = true,
    },

    -- Server list (enabled via vim.lsp.enable)
    servers = {
        "lua_ls",
        "rust_analyzer",
        "jsonls",
        "svelte",
        "astro",
        "gopls",
        "basedpyright",
        "jdtls",
        "marksman",
        "html",
        "yamlls",
        "tailwindcss",
        "htmx",
        "xml",
        "sqlls",
        "kotlin_language_server",
    },
}

-- =============================================================================
-- Telescope Configuration
-- =============================================================================
Config.telescope = {
    -- File patterns to ignore
    ignore_patterns = { "node_modules", ".git/", "target" },

    -- Layout strategy
    layout_strategy = "bottom_pane",
}

-- =============================================================================
-- Treesitter Configuration
-- =============================================================================
Config.treesitter = {
    -- Maximum file size for syntax highlighting (bytes)
    max_file_size = 100 * 1024,

    -- Languages to ensure are installed
    ensure_installed = {
        "lua", "vimdoc", "java", "jsdoc",
        "python", "rust", "javascript", "typescript", "tsx",
        "json", "yaml", "toml", "css", "html", "scss",
        "go", "cpp", "c", "bash", "fish", "markdown",
        "vue", "svelte", "astro", "sql", "regex",
    },
}

-- =============================================================================
-- Formatter Configuration
-- =============================================================================
Config.formatters = {
    -- Prettier args
    prettier_args = { "--tab-width", "4", "--use-tabs", "false" },

    -- Google Java Format args
    google_java_format_args = { "--aosp", "--line-length=100" },

    -- Format on save settings
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

-- =============================================================================
-- UI Configuration
-- =============================================================================
Config.ui = {
    -- Nerd Font
    have_nerd_font = true,

    -- Blink completion
    blink = {
        auto_show = true,
        auto_show_delay_ms = 500,
        scrolloff = 1,
    },

    -- NETRW
    netrw = {
        browse_split = 0,
        banner = 0,
        winsize = 25,
    },
}

-- =============================================================================
-- Keymapping Groups (for reference)
-- =============================================================================
Config.keymaps = {
    -- Window navigation
    window_nav = {
        left = "<C-h>",
        right = "<C-l>",
        down = "<C-j>",
        up = "<C-k>",
    },

    -- Scroll centering
    scroll_center = {
        page_down = "<C-d>",
        page_up = "<C-u>",
    },

    -- LSP keymaps prefix
    lsp_prefix = "<leader>",
}

-- =============================================================================
-- Utility Functions
-- =============================================================================

--- Safely require a module and return nil if it doesn't exist
--- @param module string
--- @return table|nil
function Config.safe_require(module)
    local ok, result = pcall(require, module)
    return ok and result or nil
end

--- Create an augroup with proper cleanup
--- @param name string
--- @param autocmds table
--- @return number
function Config.create_augroup(name, autocmds)
    local group_id = vim.api.nvim_create_augroup(name, { clear = true })
    for _, autocmd in ipairs(autocmds) do
        local opts = vim.tbl_deep_extend("force", { group = group_id }, autocmd.opts or {})
        vim.api.nvim_create_autocmd(autocmd.event, opts)
    end
    return group_id
end

--- Check if a command exists
--- @param cmd string
--- @return boolean
function Config.cmd_exists(cmd)
    local handle = io.popen("command -v " .. cmd .. " 2>/dev/null")
    if handle then
        local result = handle:read("*a")
        handle:close()
        return result and result:gsub("%s+", "") ~= ""
    end
    return false
end

--- Get current timestamp for logging
--- @return string
function Config.timestamp()
    return os.date("%Y-%m-%d %H:%M:%S")
end

return Config
