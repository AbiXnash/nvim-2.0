# ABX Neovim Configuration

<div align="center">

![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?style=for-the-badge&logo=neovim)
![Lua](https://img.shields.io/badge/Lua-5.1-blue?style=for-the-badge&logo=lua)
![Lazy.nvim](https://img.shields.io/badge/Lazy.nvim-Plugin_Manager-purple?style=for-the-badge)
![Blink.cmp](https://img.shields.io/badge/Blink.cmp-Completion-yellow?style=for-the-badge)

![Stars](https://img.shields.io/github/stars/AbiXnash/nvim?style=social)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

A modern, production-ready Neovim configuration featuring comprehensive language support, smart tooling, and a clean modular architecture.

[Features](#-features) • [Structure](#-structure) • [Keybindings](#-keybindings) • [Getting Started](#-getting-started)

</div>

---

## Features

### Core Features

| Feature | Description |
|---------|-------------|
| **Neovim 0.10+** | Built with latest Neovim APIs and capabilities |
| **Lazy.nvim** | Fast, efficient plugin management with lazy loading |
| **Modular Structure** | Clean, organized `lua/abx/` namespace |
| **Centralized Config** | All hardcoded values in `lua/abx/config.lua` |
| **Blink.cmp** | Blazing fast code completion with snippets support |
| **Session Persistence** | Auto-save/restore workspace sessions |

### Language Support

| Language | Server | Features |
|----------|--------|----------|
| ![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go) | `gopls` | Debugging, tests, formatting, inlay hints |
| ![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python) | `basedpyright` | DAP, Jupyter, type checking, venv support |
| ![Java](https://img.shields.io/badge/Java-ED8B00?style=flat&logo=java) | `jdtls` | Debugging, tests, autocomplete, refactoring |
| ![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=flat&logo=typescript) | `typescript-tools` | Organize imports, inlay hints, JSX close tags |
| ![Svelte](https://img.shields.io/badge/Svelte-FF3E00?style=flat&logo=svelte) | `svelte-language-server` | Component support, auto-imports |
| ![Astro](https://img.shields.io/badge/Astro-FC6425?style=flat&logo=astro) | `astro-language-server` | HTML templates, props hints |
| ![Rust](https://img.shields.io/badge/Rust-DEA584?style=flat&logo=rust) | `rust_analyzer` | Cargo integration, rustfmt |
| ![Lua](https://img.shields.io/badge/Lua-2C2D72?style=flat&logo=lua) | `lua_ls` | LazyDev integration, documentation |

### Development Tools

| Tool | Purpose |
|------|---------|
| ![Telescope](https://img.shields.io/badge/Telescope-Fuzzy_Finder-purple) | Files, grep, buffers, diagnostics, help tags |
| ![Trouble](https://img.shields.io/badge/Trouble-Diagnostics-red) | Diagnostics panel, lsp references, symbols |
| ![Git](https://img.shields.io/badge/Git-Integration-orange) | Gitsigns, Fugitive, diffview |
| ![Treesitter](https://img.shields.io/badge/Treesitter-Syntax-green) | Syntax highlighting, text objects, indentation |
| ![Conform](https://img.shields.io/badge/Conform-Formatting-blue) | Auto-format on save for 15+ languages |
| ![Neotest](https://img.shields.io/badge/Neotest-Testing-yellow) | Test runner (Go, Python, Java) |
| ![DAP](https://img.shields.io/badge/DAP-Debugging-red) | Debugger support (Go, Python, Java) |
| ![Sessions](https://img.shields.io/badge/Sessions-Persistence-teal) | Auto-save/restore workspace |

---

## Structure

```
nvim/
├── init.lua                          # Entry point
├── README.md                         # This file
├── lazy-lock.json                    # Pinned plugin versions
│
└── lua/abx/                          # Main configuration namespace
    ├── config.lua                    # Centralized configuration (NEW)
    ├── init.lua                      # Bootstrap & lazy.nvim setup
    │
    ├── configs/                      # Core editor settings
    │   ├── options.lua               # vim.opt settings
    │   ├── remaps.lua                # Key mappings
    │   └── autocmd.lua               # Autocommands
    │
    ├── core/                         # LSP & core functionality
    │   ├── lsp.lua                   # Main LSP configuration
    │   ├── lsp-attach.lua            # LSP attach handlers
    │   ├── lsp-keymaps.lua           # LSP keymaps
    │   └── lsp-commands.lua          # Custom LSP commands
    │
    ├── lsp/servers/                  # LSP server configurations (UPDATED)
    │   ├── astro.lua
    │   ├── basedpyright.lua
    │   ├── gopls.lua
    │   ├── jdtls.lua
    │   ├── json_ls.lua
    │   ├── lua_ls.lua
    │   ├── rust_analyzer.lua
    │   ├── svelte.lua
    │   └── typescript.lua
    │
    └── plugins/                      # Plugin configurations
        ├── init.lua                  # Main plugins entry
        │
        ├── lang/                     # Language-specific plugins
        │   ├── init.lua
        │   ├── go-dev.lua
        │   ├── java.lua
        │   ├── python.lua
        │   ├── web.lua
        │   └── jupytxt.lua
        │
        ├── ui/                       # User interface plugins
        │   ├── init.lua
        │   ├── blink.lua
        │   ├── colorscheme.lua
        │   ├── comments.lua
        │   ├── codesnap.lua
        │   └── statusline.lua
        │
        └── tools/                    # Development utilities
            ├── init.lua
            ├── telescope.lua
            ├── git.lua
            ├── trouble.lua
            ├── treesitter.lua
            ├── formatters.lua
            ├── lsp.lua
            ├── mason.lua
            ├── sessions.lua
            ├── inline-diagnostics.lua
            └── undotree.lua
```

### Category Guide

| Folder | Purpose | Examples |
|--------|---------|----------|
| `config.lua` | Centralized settings | All hardcoded values |
| `configs/` | Core config | Options, keymaps, autocmds |
| `core/` | LSP functionality | Attach, keymaps, commands |
| `lsp/servers/` | Server configs | Server-specific settings |
| `plugins/lang/` | Language tools | LSPs, debuggers, test runners |
| `plugins/ui/` | Visual plugins | Colors, completion, comments |
| `plugins/tools` | Dev utilities | Search, git, format, diagnostics |

### Configuration Module

The `config.lua` file centralizes all hardcoded values:

```lua
Config = {
    editor = {
        leader_key = " ",
        tabstop = 4,
        scrolloff = 20,
        -- ...
    },
    lsp = {
        servers = { "lua_ls", "gopls", ... },
        format_timeout = 2000,
    },
    -- ...
}
```

**Utility Functions:**

| Function | Purpose |
|----------|---------|
| `C.safe_require(module)` | Safely require with error handling |
| `C.create_augroup(name, autocmds)` | Create autocmd groups |
| `C.cmd_exists(cmd)` | Check if command exists |

---

## Keybindings

### General Editing

| Key | Mode | Description |
|-----|------|-------------|
| `jk` | Insert | Exit insert mode quickly |
| `<Esc>` | Normal | Clear search highlight |
| `<C-c>` | Visual | Copy to system clipboard |
| `gcc` | Normal | Toggle line comment |
| `gbc` | Normal | Toggle block comment |

### File & Window Management

| Key | Description |
|-----|-------------|
| `<leader>pv` | File tree (netrw) |
| `<C-h/j/k/l>` | Navigate windows (left/down/up/right) |
| `<C-up/down/left>` | Split explore (above/below/left) |

### LSP Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `gr` | Normal | Go to references |
| `gt` | Normal | Go to type definition |
| `K` | Normal | Hover documentation |
| `<C-k>` | Normal/Insert | Signature help |
| `<leader>ca` | Normal/Visual | Code action |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>cf` | Normal | Format buffer |

### Telescope (Fuzzy Finder)

| Key | Description |
|-----|-------------|
| `<leader><leader>` | Find files |
| `<leader>fg` | Find git files |
| `<leader>fs` | Live grep (search) |
| `<leader>fb` | Find buffers |
| `<leader>fd` | Find diagnostics |
| `<leader>fh` | Find help tags |
| `<leader>fr` | Find recent files |

### Diagnostics

| Key | Description |
|-----|-------------|
| `[d` / `]d` | Previous/Next diagnostic |
| `<leader>cd` | Show diagnostic float |
| `<leader>xx` | Open Trouble panel |
| `<leader>xX` | Buffer diagnostics |

### Git

| Key | Description |
|-----|-------------|
| `<leader>g` | Git status (Fugitive) |
| `]c` / `[c` | Next/Previous hunk |
| `<leader>ghs` | Stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghp` | Preview hunk |

### Sessions

| Key | Description |
|-----|-------------|
| `<leader>ss` | Save session |
| `<leader>sl` | Load session |
| `<leader>sd` | Delete session |
| `<leader>sp` | Load last session |

### Utilities

| Key | Description |
|-----|-------------|
| `<leader>U` | Toggle undo tree |
| `<leader>cc` | Code snap (clipboard) |
| `<leader>cs` | Code snap (Pictures) |

---

## Commands

### LSP Commands

| Command | Description |
|---------|-------------|
| `:LspRestart` | Restart LSP servers |
| `:LspStatus` | Show LSP status |
| `:LspCapabilities` | Show LSP capabilities |
| `:LspDetails` | Comprehensive LSP info |
| `:LspDiagnostics` | Diagnostic counts |
| `:LspInstalled` | List installed servers |
| `:LspList` | List all LSP details |
| `:Mason` | Open package manager UI |

### Session Commands

| Command | Description |
|---------|-------------|
| `:SessionSave` | Save current session |
| `:SessionLoad` | Load last session |
| `:SessionDelete` | Delete session |

---

## Getting Started

### Prerequisites

| Requirement | Description | Platform |
|-------------|-------------|----------|
| **Neovim 0.10+** | Latest stable recommended | All |
| **Git** | For plugin management | All |
| **Ripgrep** (`rg`) | Telescope search functionality | All |
| **Node.js & npm** | Web development tools | All |
| **Python 3.8+** | Python debugging (debugpy) | All |
| **Nerd Font** | Icons and symbols | All |

### Installation

```bash
# 1. Backup existing configuration
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup

# 2. Clone this configuration
git clone https://github.com/AbiXnash/nvim-2.0 ~/.config/nvim

# 3. Launch Neovim (plugins auto-install)
nvim
```

### Install Language Servers

```bash
# In Neovim
:Mason

# Or via command line
nvim --headless -c "MasonInstall jdtls gopls basedpyright" -c "qa"
```

---

## Customization

### Modify Centralized Config

Edit `lua/abx/config.lua`:

```lua
Config.editor = {
    tabstop = 4,           -- Change tab width
    scrolloff = 20,        -- Change scroll offset
    -- ...
}
```

### Add New Language Server

1. **Install with Mason**: Run `:Mason` and select server
2. **Enable in config**: Edit `lua/abx/config.lua`:
    ```lua
    Config.lsp.servers = {
        "existing_servers",
        "your_new_server",
    }
    ```
3. **Create server config**: Add `lua/abx/lsp/servers/your_server.lua`

### Add New Plugin

1. **Choose category**: `lang/`, `ui/`, or `tools/`
2. **Create plugin file**:
    ```lua
    -- lua/abx/plugins/your-category/plugin-name.lua
    return {
        "author/plugin-name",
        event = "BufEnter",
        config = function()
            require("plugin").setup({})
        end,
    }
    ```
3. **Add to category init**: Import in `plugins/your-category/init.lua`

### Add Keymaps

Edit `lua/abx/configs/remaps.lua`:
```lua
vim.keymap.set("n", "<leader>key", "<cmd>Command<CR>", {
    desc = "Your description"
})
```

### Change Theme

Edit `lua/abx/plugins/ui/colorscheme.lua`:
```lua
vim.cmd.colorscheme "catppuccin"  -- Primary theme
-- or
vim.cmd.colorscheme "kanagawa"    -- Alternative
```

---

## File Reference

### Core Files

| File | Purpose | Lines |
|------|---------|-------|
| `init.lua` | Entry point | 2 |
| `lua/abx/config.lua` | Centralized configuration | ~220 |
| `lua/abx/init.lua` | Bootstrap & lazy setup | ~60 |
| `lua/abx/configs/options.lua` | vim.opt settings | ~75 |
| `lua/abx/configs/remaps.lua` | Key mappings | ~85 |
| `lua/abx/configs/autocmd.lua` | Autocommands | ~90 |

### LSP Files

| File | Purpose |
|------|---------|
| `lua/abx/core/lsp.lua` | Main LSP config & capabilities |
| `lua/abx/core/lsp-attach.lua` | Attach handlers & inlay hints |
| `lua/abx/core/lsp-keymaps.lua` | LSP keymaps |
| `lua/abx/core/lsp-commands.lua` | Custom LSP commands |
| `lua/abx/lsp/servers/*.lua` | Server-specific settings |

### Plugin Categories

| Category | Path | Files |
|----------|------|-------|
| Language | `plugins/lang/` | 5 |
| UI | `plugins/ui/` | 5 |
| Tools | `plugins/tools/` | 10 |

---

## Resources

### Documentation

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Guide](https://github.com/folke/lazy.nvim)
- [LSP Configuration](https://neovim.io/doc/user/lsp.html)
- [Blink.cmp](https://github.com/Saghen/blink.cmp)

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## License

MIT License - feel free to use and modify.

---

<div align="center">

**Happy Coding!**

Built with for the Neovim community

![Neovim Logo](https://neovim.io/images/logo@2x.png)

</div>
