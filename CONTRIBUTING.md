# Contributing to ABX Neovim Configuration

Thank you for your interest in contributing! This document outlines the guidelines for contributing.

## 📋 Table of Contents

- [Code Style](#-code-style)
- [Adding New Plugins](#-adding-new-plugins)
- [Adding Language Support](#-adding-language-support)
- [Submitting Changes](#-submitting-changes)

## 🎨 Code Style

### Lua Code

- Use **4 spaces** for indentation (no tabs)
- Add **comments** to explain complex configurations
- Use **descriptive variable names**
- Follow **lazy.nvim spec format** for plugins

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
vim.keymap.set("n", "<leader>key", "<cmd>Command<CR>", {
    desc = "Clear and concise description",
    silent = true,
    noremap = true,
})
```

## ➕ Adding New Plugins

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

## 🌐 Adding Language Support

### Complete Language Setup Checklist

1. **LSP Server** - Add to `lua/abx/core/lsp.lua`:
   ```lua
   vim.lsp.enable({ "your-server" })
   ```

2. **Server Config** - Create `lsp/your_server.lua`:
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
   "your-server",  -- in ensure_installed
   ```

5. **Formatter** - Add to `lua/abx/plugins/tools/formatters.lua`:
   ```lua
   your_lang = { "your-formatter" },
   ```

6. **Treesitter** - Add to `lua/abx/plugins/tools/treesitter.lua`:
   ```lua
   ensure_installed = { ..., "your-lang" },
   ```

7. **Keybindings** - Add to `README.md`

8. **Documentation** - Document in `PLUGINS.md`

## 📝 Submitting Changes

### Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): description

feat(core): add new LSP command
fix(config): resolve filetype option error
docs(readme): update keybindings table
refactor(plugins): reorganize category structure
```

### Types

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation changes |
| `style` | Code style changes |
| `refactor` | Code refactoring |
| `perf` | Performance improvements |
| `test` | Adding tests |
| `chore` | Maintenance tasks |

### Pull Request Guidelines

1. **Describe changes** - What did you change and why?
2. **Test locally** - Verify everything works
3. **Update docs** - Keep documentation in sync
4. **Keep focused** - One PR per feature/fix

---

## ❓ Getting Help

- Open an [Issue](https://github.com/AbiXnash/nvim/issues)
- Check existing [Discussions](https://github.com/AbiXnash/nvim/discussions)
- Reference [README.md](README.md)

---

Thank you for contributing! 🎉
