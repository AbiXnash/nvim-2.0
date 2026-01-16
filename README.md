# 🚀 ABX Neovim Configuration

A modern, production-ready Neovim configuration featuring comprehensive language support, smart tooling, and a clean modular architecture.

## ✨ Features

### Core
- **Neovim 0.10+** - Built with latest Neovim APIs
- **Lazy.nvim** - Fast plugin manager with lazy loading
- **Modular Structure** - Organized `lua/abx/` namespace
- **blink.cmp** - Blazing fast code completion with snippets

### Language Support
| Language | Server | Features |
|----------|--------|----------|
| Go | gopls | Debugging, tests, formatting |
| Python | basedpyright, pylsp | DAP, Jupyter, type checking |
| Java | jdtls | Debugging, tests, autocomplete |
| TypeScript | typescript-language-server | Organize imports, inlay hints |
| Svelte | svelte-language-server | Component support |
| Astro | astro-language-server | HTML templates |
| Rust | rust_analyzer | Cargo integration |
| Lua | lua_ls | LazyDev integration |

### Development Tools
- **Telescope** - Fuzzy finder (files, grep, buffers, diagnostics)
- **Trouble** - Diagnostics panel
- **Git** - Gitsigns, Fugitive, diffview
- **Treesitter** - Syntax highlighting
- **Conform** - Auto-format on save
- **Neotest** - Test runner (Go, Python, Java)
- **nvim-dap** - Debugger support (Go, Python, Java)
- **Sessions** - Auto-save/restore workspace

---

## 📁 Structure

```
nvim/
├── init.lua                    # Entry point
├── README.md                   # This file
├── lazy-lock.json              # Pinned plugin versions
│
├── lsp/                        # LSP server configurations
│   ├── astro.lua              # Astro
│   ├── basedpyright.lua       # Python
│   ├── gopls.lua              # Go
│   ├── jdtls.lua              # Java
│   ├── json_ls.lua            # JSON
│   ├── lua_ls.lua             # Lua
│   ├── pylsp.lua              # Python (alternative)
│   ├── rust_analyzer.lua      # Rust
│   ├── svelte.lua             # Svelte
│   └── typescript.lua         # TypeScript
│
└── lua/abx/                   # Main configuration
    ├── init.lua               # Bootstrap & lazy.nvim setup
    │
    ├── configs/               # Core editor settings
    │   ├── options.lua        # vim.opt settings
    │   ├── remaps.lua         # Key mappings
    │   └── autocmd.lua        # Autocommands
    │
    ├── core/                  # LSP & core functionality
    │   ├── lsp.lua            # LSP configuration
    │   ├── lsp-attach.lua     # LSP attach handlers
    │   ├── lsp-keymaps.lua    # LSP keymaps
    │   └── lsp-commands.lua   # LSP commands
    │
    └── plugins/               # Plugin configurations (by category)
        ├── lang/              # Language-specific
        │   ├── java.lua       # Java (JDTLS, dap, neotest)
        │   ├── python.lua     # Python (pylsp, dap-python, jupytext)
        │   ├── go-dev.lua     # Go (gopls, neotest-go, structrue-go)
        │   ├── jupytxt.lua    # Jupyter notebooks
        │   └── web.lua        # Web (TS, Svelte, Astro)
        │
        ├── ui/                # User interface
        │   ├── blink.lua      # Code completion
        │   ├── colorscheme.lua# Theme (catppuccin)
        │   ├── comments.lua   # Comment toggling
        │   ├── codesnap.lua   # Code screenshots
        │   └── statusline.lua # Status bar
        │
        └── tools/             # Development utilities
            ├── telescope.lua  # Fuzzy finder
            ├── git.lua        # Git integration
            ├── trouble.lua    # Diagnostics viewer
            ├── treesitter.lua # Syntax highlighting
            ├── formatters.lua # Code formatting
            ├── lsp.lua        # LSP plugins
            ├── mason.lua      # LSP package manager
            ├── sessions.lua   # Session persistence
            ├── inline-diagnostics.lua # Inline errors
            └── undotree.lua   # Undo history
```

### Category Guide

| Folder | Purpose | Examples |
|--------|---------|----------|
| `lang/` | Language tools | LSPs, debuggers, test runners |
| `ui/` | Visual plugins | Colors, completion, comments |
| `tools` | Dev utilities | Search, git, format, diagnostics |
| `configs` | Core config | Options, keymaps, autocmds |
| `core` | LSP functionality | Attach, keymaps, commands |
| `lsp/` | Server configs | Server-specific settings |

---

## ⌨️ Keybindings

### General

| Key | Mode | Description |
|-----|------|-------------|
| `jk` | Insert | Exit insert mode |
| `<Esc>` | Normal | Clear search highlight |
| `<C-c>` | Visual | Copy to system clipboard |
| `<leader>pv` | Normal | File tree (netrw) |

### Window Navigation

| Key | Description |
|-----|-------------|
| `<C-h>` | Window left |
| `<C-j>` | Window down |
| `<C-k>` | Window up |
| `<C-l>` | Window right |
| `<C-up>` | Split above |
| `<C-down>` | Split below |
| `<C-left>` | Split left |

### LSP

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

### Telescope

| Key | Description |
|-----|-------------|
| `<leader><leader>` | Find files |
| `<leader>fg` | Find git files |
| `<leader>fs` | Live grep |
| `<leader>fb` | Find buffers |

### Diagnostics

| Key | Description |
|-----|-------------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>cd` | Show diagnostic float |
| `<leader>xx` | Open Trouble panel |

### Git

| Key | Description |
|-----|-------------|
| `<leader>g` | Git status (Fugitive) |

### Sessions

| Key | Description |
|-----|-------------|
| `<leader>ss` | Save session |
| `<leader>sl` | Load session |
| `<leader>sd` | Delete session |

### Utilities

| Key | Description |
|-----|-------------|
| `<leader>U` | Toggle undo tree |
| `<leader>cc` | Code snap (clipboard) |
| `<leader>cs` | Code snap (Pictures) |

### Go Development

| Key | Description |
|-----|-------------|
| `<leader>gt` | Run nearest test |
| `<leader>gT` | Run all tests in file |
| `<leader>gs` | Test summary |
| `<leader>go` | Test output |

### Java Development

| Key | Description |
|-----|-------------|
| `<leader>dc` | Continue debugging |
| `<leader>db` | Toggle breakpoint |
| `<leader>ds` | Step over |
| `<leader>di` | Step into |
| `<leader>jt` | Run test |
| `<leader>jT` | Run all tests |

### TypeScript/Web

| Key | Description |
|-----|-------------|
| `<leader>oi` | Organize imports |
| `<leader>ai` | Add missing imports |
| `<leader>ru` | Remove unused |

---

## 🛠️ Commands

### LSP
| Command | Description |
|---------|-------------|
| `:LspRestart` | Restart all LSP servers |
| `:LspInfo` | Show LSP status |
| `:Mason` | Open Mason UI |

### Sessions
| Command | Description |
|---------|-------------|
| `:SessionSave` | Save current session |
| `:SessionLoad` | Load last session |

### Tests
| Command | Description |
|---------|-------------|
| `:Neotest run` | Run nearest test |
| `:Neotest run file` | Run all file tests |
| `:Neotest summary` | Show test summary |

### Debugging
| Command | Description |
|---------|-------------|
| `:DapContinue` | Start/continue debug |
| `:DapToggleBreakpoint` | Toggle breakpoint |
| `:DapTerminate` | End debug session |

---

## 🚀 Getting Started

### Prerequisites
- Neovim 0.10+
- Git
- Ripgrep (`rg`)
- Language-specific tools (Go, Python, Java, etc.)

### Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup

# Clone this config
git clone <repo-url> ~/.config/nvim

# Launch Neovim (plugins auto-install)
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

## 🔧 Customization

### Add New Language Server

1. Install: `:Mason` → select server
2. Enable: Edit `lua/abx/core/lsp.lua`:
```lua
vim.lsp.enable({
    "existing_servers",
    "your_new_server",
})
```
3. Configure: Create `lsp/your_server.lua`

### Add New Plugin

1. Choose category: `lang/`, `ui/`, or `tools/`
2. Create file in appropriate folder:
```lua
-- lua/abx/plugins/your-category/plugin-name.lua
return {
    "author/plugin-name",
    event = "BufEnter",
    config = function()
        -- Your configuration
    end,
}
```

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
vim.cmd.colorscheme "catppuccin"  -- or "kanagawa"
```

---

## 📚 File Reference

### Core Files

| File | Purpose |
|------|---------|
| `init.lua` | Entry point, bootstrap |
| `lua/abx/init.lua` | Lazy setup, config loading |
| `lua/abx/configs/options.lua` | vim.opt settings |
| `lua/abx/configs/remaps.lua` | Key mappings |
| `lua/abx/configs/autocmd.lua` | Autocommands |

### LSP Files

| File | Purpose |
|------|---------|
| `lua/abx/core/lsp.lua` | Main LSP config |
| `lua/abx/core/lsp-attach.lua` | Attach handlers |
| `lua/abx/core/lsp-keymaps.lua` | LSP keymaps |
| `lsp/*.lua` | Server-specific settings |

### Plugin Categories

| Category | Path | Contents |
|----------|------|----------|
| Language | `plugins/lang/` | LSPs, debuggers, test runners |
| UI | `plugins/ui/` | Colors, completion, comments |
| Tools | `plugins/tools/` | Search, git, format, diagnostics |

---

## 🧪 Testing

### Run Tests
```bash
# Go tests
cd project && go test ./...

# Python tests
pytest

# Java tests
mvn test
```

### Debugging
```bash
# Start debug session
:DapContinue

# Toggle breakpoint
:DapToggleBreakpoint
```

---

## 📖 Resources

- [Neovim Docs](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [Neovim LSP](https://neovim.io/doc/user/lsp.html)
- [Mason](https://github.com/williamboman/mason.nvim)

---

**Happy Coding! 🎉**

Built with ❤️ using Neovim
