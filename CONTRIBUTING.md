# Contributing to ABX Neovim Configuration

Thank you for your interest in contributing! This document outlines the guidelines for contributing.

## Table of Contents

- [Code Style](#-code-style)
- [Centralized Configuration](#-centralized-configuration)
- [Adding New Plugins](#-adding-new-plugins)
- [Adding Language Support](#-adding-language-support)
- [Submitting Changes](#-submitting-changes)

## Code Style

### Lua Code

- Use **4 spaces** for indentation (no tabs)
- Add **comments** to explain complex configurations
- Use **descriptive variable names**
- Follow **lazy.nvim spec format** for plugins
- Use `C = require("abx.config")` for centralized values
- Use `C.safe_require()` for optional dependencies

### Example Plugin Structure

```lua
-- =============================================================================
-- Plugin Name
-- =============================================================================
-- Description of what this plugin does and why it's included
-- =============================================================================
return {
    "author/plugin-name",
    -- Event-based loading for better performance
    event = "BufEnter",
    -- Or use ft = "filetype" for file-type specific plugins
    ft = "python",

    dependencies = {
        "dependency/plugin",
    },

    config = function()
        -- Plugin configuration
        require("plugin").setup({
            -- options
        })
    end,
}
```

### Example Keymap

```lua
-- =============================================================================
-- Description of what these keymaps do
-- =============================================================================
local C = require("abx.config")

vim.keymap.set("n", "<leader>key", "<cmd>Command<CR>", {
    desc = "Clear and concise description",
    silent = true,
    noremap = true,
})
```

---

## Centralized Configuration

All hardcoded values are centralized in `lua/abx/config.lua`.

### Configuration Sections

| Section | Purpose |
|---------|---------|
| `Config.editor` | Editor options (tabstop, scrolloff, etc.) |
| `Config.lsp` | LSP servers, format timeout, diagnostics |
| `Config.telescope` | Telescope patterns, layout strategy |
| `Config.treesitter` | Languages, max file size |
| `Config.formatters` | Formatter args, format on save |
| `Config.ui` | UI settings, blink, netrw |
| `Config.keymaps` | Keymapping groups |

### Utility Functions

```lua
local C = require("abx.config")

-- Safe require with error handling
local conform = C.safe_require("conform")

-- Create autocmd groups
C.create_augroup("my-group", {
    { event = "BufEnter", opts = { ... } },
})

-- Check if command exists
if C.cmd_exists("rg") then
    -- use ripgrep
end
```

### Modifying Config Values

Edit `lua/abx/config.lua`:

```lua
Config.editor = {
    tabstop = 4,           -- Tab width
    scrolloff = 20,        -- Lines of context
    wrap = false,          -- Disable wrapping
}

Config.lsp = {
    format_timeout = 2000, -- Format timeout (ms)
    servers = {            -- LSP servers to enable
        "lua_ls",
        "gopls",
        -- add your server
    },
}
```

---

## Adding New Plugins

### Step 1: Choose the Right Category

| Category | When to Use |
|----------|-------------|
| `lang/` | Language-specific tools (LSPs, debuggers, test runners) |
| `ui/` | Visual plugins (themes, completion, comments, statusline) |
| `tools` | Development utilities (search, git, format, diagnostics) |

### Step 2: Create Plugin File

Create a new file in the appropriate category:

```lua
-- lua/abx/plugins/[category]/my-plugin.lua
local C = require("abx.config")

return {
    "author/plugin-name",
    -- Load when entering a buffer
    event = "BufEnter",
    config = function()
        require("plugin-name").setup({
            -- your config
        end)
    end,
}
```

### Step 3: Update Category Init

Add to `lua/abx/plugins/[category]/init.lua`:

```lua
-- Your plugin
{ import = "abx.plugins.[category].my-plugin" },
```

### Step 4: Add Documentation

- Update `README.md` with new keybindings
- Add plugin to `PLUGINS.md` if it's a significant addition

---

## Adding Language Support

### Complete Language Setup Checklist

1. **Centralized Config** - Add to `lua/abx/config.lua`:
    ```lua
    Config.lsp.servers = { ..., "your-server" }
    ```

2. **LSP Server Config** - Create `lua/abx/lsp/servers/your_server.lua`:
    ```lua
    return {
        cmd = { "your-server" },
        filetypes = { "your-lang" },
        root_markers = { "your-marker" },
        settings = {},
    }
    ```

3. **Plugin File** - Create `lua/abx/plugins/lang/your-lang.lua`:
    ```lua
    return {
        -- LSP, dap, neotest, etc.
    }
    ```

4. **Mason** - Add to `lua/abx/plugins/tools/mason.lua`:
    ```lua
    ensure_installed = {
        ...
        "your-server",  -- add here
    }
    ```

5. **Formatter** - Add to `lua/abx/plugins/tools/formatters.lua`:
    ```lua
    your_lang = { "your-formatter" },
    ```

6. **Treesitter** - Add to `lua/abx/config.lua`:
    ```lua
    Config.treesitter.ensure_installed = { ..., "your-lang" }
    ```

7. **Keybindings** - Add to `lua/abx/configs/remaps.lua` and `README.md`

---

## Submitting Changes

### Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): description

feat(config): add new centralized setting
fix(core): resolve LSP attach issue
docs(readme): update keybindings table
refactor(plugins): reorganize category structure
```

### Cross-Platform Testing

Test your changes on:

| Platform | Terminal | Notes |
|----------|----------|-------|
| Linux | Alacritty, Kitty, WezTerm | Primary development platform |
| macOS | iTerm2, Alacritty | May need `reattach-to-user-namespace` for clipboard |
| Windows WSL2 | Windows Terminal | Recommended for Windows users |
| Windows Native | Windows Terminal, Alacritty | Some plugins may behave differently |

### Pull Request Guidelines

1. **Describe changes** - What did you change and why?
2. **Test locally** - Verify everything works
3. **Test cross-platform** - Especially for path-related changes
4. **Update docs** - Keep documentation in sync
5. **Keep focused** - One PR per feature/fix

### Windows-Specific Notes

- Use `vim.fn.expand("$HOME")` instead of `~` for paths
- Path separators: Use `vim.fs.joinpath` or `path:gsub("/", "\\")`
- Line endings: Configure `vim.o.fileformat = "dos"` for Windows compatibility
- Shell: PowerShell or WSL bash

Example Windows-safe path handling:
```lua
local config_path = vim.fn.stdpath("config")
local data_path = vim.fn.stdpath("data")
```

---

## Getting Help

- Open an [Issue](https://github.com/AbiXnash/nvim-2.0/issues)
- Check existing [Discussions](https://github.com/AbiXnash/nvim-2.0/discussions)
- Reference [README.md](README.md)

---

Thank you for contributing!
