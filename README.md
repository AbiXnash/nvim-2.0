# 🚀 ABX Neovim Configuration

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

## ✨ Features

### Core Features

| Feature | Description |
|---------|-------------|
| **Neovim 0.10+** | Built with latest Neovim APIs and capabilities |
| **Lazy.nvim** | Fast, efficient plugin management with lazy loading |
| **Modular Structure** | Clean, organized `lua/abx/` namespace |
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

## 📁 Structure

```
nvim/
├── init.lua                          # Entry point
├── README.md                         # This file
├── lazy-lock.json                    # Pinned plugin versions
│
├── lsp/                              # LSP server configurations
│   ├── astro.lua                    # Astro language server
│   ├── basedpyright.lua             # Python type checker
│   ├── gopls.lua                    # Go language server
│   ├── jdtls.lua                    # Java language server
│   ├── json_ls.lua                  # JSON language server
│   ├── lua_ls.lua                   # Lua language server
│   ├── pylsp.lua                    # Python LSP (alternative)
│   ├── rust_analyzer.lua            # Rust language server
│   ├── svelte.lua                   # Svelte language server
│   └── typescript.lua               # TypeScript language server
│
└── lua/abx/                         # Main configuration namespace
    ├── init.lua                     # Bootstrap & lazy.nvim setup
    │
    ├── configs/                     # Core editor settings
    │   ├── options.lua              # vim.opt settings (options, UI, indentation)
    │   ├── remaps.lua               # Key mappings (general, window, git)
    │   └── autocmd.lua              # Autocommands (yank highlight, format on save)
    │
    ├── core/                        # LSP & core functionality
    │   ├── lsp.lua                  # Main LSP configuration & capabilities
    │   ├── lsp-attach.lua           # LSP attach handlers & inlay hints
    │   ├── lsp-keymaps.lua          # LSP keymaps (goto, hover, code actions)
    │   └── lsp-commands.lua         # Custom LSP commands (restart, status, capabilities)
    │
    └── plugins/                     # Plugin configurations (organized by category)
        ├── init.lua                 # Main plugins entry (imports all categories)
        │
        ├── lang/                    # Language-specific plugins
        │   ├── init.lua             # Lang plugins entry (imports all lang plugins)
        │   ├── java.lua             # Java (JDTLS, dap, neotest)
        │   ├── python.lua           # Python (basedpyright, dap-python, jupytext)
        │   ├── go-dev.lua           # Go (gopls, neotest-go, structrue-go)
        │   ├── jupytxt.lua          # Jupyter notebooks integration
        │   └── web.lua              # Web (typescript-tools, svelte, astro)
        │
        ├── ui/                      # User interface plugins
        │   ├── init.lua             # UI plugins entry (imports all UI plugins)
        │   ├── blink.lua            # Code completion (blink.cmp)
        │   ├── colorscheme.lua      # Theme (catppuccin + kanagawa)
        │   ├── comments.lua         # Comment toggling (Comment.nvim)
        │   ├── codesnap.lua         # Code screenshots
        │   └── statusline.lua       # Status bar (lualine)
        │
        └── tools/                   # Development utilities
            ├── init.lua             # Tools plugins entry (imports all tools)
            ├── telescope.lua        # Fuzzy finder (telescope + fzf)
            ├── git.lua              # Git integration (gitsigns, fugitive, diffview)
            ├── trouble.lua          # Diagnostics viewer
            ├── treesitter.lua       # Syntax highlighting
            ├── formatters.lua       # Code formatting (conform + none-ls)
            ├── lsp.lua              # LSP plugins (lspconfig, nvim-lspconfig)
            ├── mason.lua            # LSP package manager
            ├── sessions.lua         # Session persistence
            ├── inline-diagnostics.lua # Inline diagnostics
            └── undotree.lua         # Undo history
```

### Plugin Structure

The plugins directory uses a hierarchical structure for better organization:

```
plugins/
├── init.lua           # Main entry - imports all categories
│
├── lang/
│   ├── init.lua       # Imports: go-dev, java, python, web, jupytxt
│   ├── go-dev.lua
│   ├── java.lua
│   ├── python.lua
│   ├── web.lua
│   └── jupytxt.lua
│
├── ui/
│   ├── init.lua       # Imports: blink, colorscheme, comments, codesnap, statusline
│   ├── blink.lua
│   ├── colorscheme.lua
│   ├── comments.lua
│   ├── codesnap.lua
│   └── statusline.lua
│
└── tools/
    ├── init.lua       # Imports: telescope, git, formatters, lsp, mason, sessions...
    ├── telescope.lua
    ├── git.lua
    ├── formatters.lua
    ├── lsp.lua
    ├── mason.lua
    ├── sessions.lua
    ├── treesitter.lua
    ├── trouble.lua
    ├── undotree.lua
    └── inline-diagnostics.lua
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

### General Editing

| Key | Mode | Description |
|-----|------|-------------|
| `jk` | Insert | Exit insert mode quickly |
| `<Esc>` | Normal | Clear search highlight |
| `<C-c>` | Visual | Copy to system clipboard |
| `gcc` | Normal | Toggle line comment |
| `gbc` | Normal | Toggle block comment |
| `<leader>/` | Normal/Visual | Toggle comment (leader) |

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

### Language-Specific

#### Go Development

| Key | Description |
|-----|-------------|
| `<leader>gt` | Run nearest test |
| `<leader>gT` | Run all tests in file |
| `<leader>gs` | Test summary |
| `<leader>go` | Test output |
| `<leader>gf` | Run test function |

#### Java Development

| Key | Description |
|-----|-------------|
| `<leader>dc` | Continue debugging |
| `<leader>dr` | Toggle REPL |
| `<leader>dk` | Terminate debug |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>ds` | Step over |
| `<leader>di` | Step into |
| `<leader>do` | Step out |
| `<leader>jt` | Run nearest test |
| `<leader>jT` | Run all tests in file |

#### Python Development

| Key | Description |
|-----|-------------|
| `<leader>dv` | Select virtual environment |

#### TypeScript/Web

| Key | Description |
|-----|-------------|
| `<leader>oi` | Organize imports |
| `<leader>ai` | Add missing imports |
| `<leader>ru` | Remove unused |

---

## 🛠️ Commands

### LSP Commands

| Command | Description |
|---------|-------------|
| `:LspRestart` | Restart LSP servers |
| `:LspStatus` | Show LSP status |
| `:LspCapabilities` | Show LSP capabilities |
| `:LspDetails` | Comprehensive LSP info |
| `:Mason` | Open package manager UI |

### Session Commands

| Command | Description |
|---------|-------------|
| `:SessionSave` | Save current session |
| `:SessionLoad` | Load last session |
| `:SessionDelete` | Delete session |

### Test Commands (Neotest)

| Command | Description |
|---------|-------------|
| `:Neotest run` | Run nearest test |
| `:Neotest run file` | Run all tests in file |
| `:Neotest summary` | Show test summary |
| `:Neotest output` | Show test output |

### Debug Commands (DAP)

| Command | Description |
|---------|-------------|
| `:DapContinue` | Start/continue debug |
| `:DapToggleBreakpoint` | Toggle breakpoint |
| `:DapTerminate` | End debug session |
| `:DapStepOver` | Step over |
| `:DapStepInto` | Step into |
| `:DapStepOut` | Step out |

---

## 🚀 Getting Started

### Prerequisites

| Requirement | Description |
|-------------|-------------|
| **Neovim 0.10+** | Latest stable recommended |
| **Git** | For plugin management |
| **Ripgrep** (`rg`) | Telescope search functionality |
| **Node.js & npm** | Web development tools |
| **Python 3+** | Python debugging (debugpy) |
| **Go** | Go development support |
| **Java 21+** | Java development (JDTLS) |

### Installation

```bash
# 1. Backup existing configuration
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup

# 2. Clone this configuration
git clone https://github.com/AbiXnash/nvim ~/.config/nvim

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

## 🔧 Customization

### Add New Language Server

1. **Install with Mason**: Run `:Mason` and select server
2. **Enable in LSP config**: Edit `lua/abx/core/lsp.lua`
   ```lua
   vim.lsp.enable({
       "existing_servers",
       "your_new_server",
   })
   ```
3. **Create server config**: Add `lsp/your_server.lua`

### Add New Plugin

1. **Choose category**: `lang/`, `ui/`, or `tools/`
2. **Create plugin file**:
   ```lua
   -- lua/abx/plugins/your-category/plugin-name.lua
   return {
       "author/plugin-name",
       event = "BufEnter",
       config = function()
           -- Plugin configuration
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

## 📚 File Reference

### Core Files

| File | Purpose | Lines |
|------|---------|-------|
| `init.lua` | Entry point | 1 |
| `lua/abx/init.lua` | Bootstrap & lazy setup | ~70 |
| `lua/abx/configs/options.lua` | vim.opt settings | ~140 |
| `lua/abx/configs/remaps.lua` | Key mappings | ~90 |
| `lua/abx/configs/autocmd.lua` | Autocommands | ~40 |

### LSP Files

| File | Purpose |
|------|---------|
| `lua/abx/core/lsp.lua` | Main LSP config & capabilities |
| `lua/abx/core/lsp-attach.lua` | Attach handlers & inlay hints |
| `lua/abx/core/lsp-keymaps.lua` | LSP keymaps |
| `lua/abx/core/lsp-commands.lua` | Custom LSP commands |
| `lsp/*.lua` | Server-specific settings |

### Plugin Categories

| Category | Path | Contents |
|----------|------|----------|
| Language | `plugins/lang/` | 5 plugin files |
| UI | `plugins/ui/` | 5 plugin files |
| Tools | `plugins/tools/` | 10 plugin files |

---

## 🧪 Testing & Debugging

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

# Conditional breakpoint
:DapBreakpointCondition
```

---

## 📖 Resources

### Documentation

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Guide](https://github.com/folke/lazy.nvim)
- [LSP Configuration](https://neovim.io/doc/user/lsp.html)
- [Blink.cmp](https://github.com/Saghen/blink.cmp)

### Plugins Used

| Category | Plugins |
|----------|---------|
| Completion | blink.cmp, LuaSnip, friendly-snippets |
| LSP | lspconfig, nvim-lspconfig, mason |
| Fuzzy Finder | telescope.nvim, telescope-fzf-native |
| Syntax | nvim-treesitter |
| Diagnostics | nvim-diagnostic, trouble.nvim |
| Git | gitsigns.nvim, vim-fugitive, diffview.nvim |
| Testing | neotest, nvim-dap |
| UI | lualine, catppuccin, Comment.nvim |

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

### Guidelines

- Follow the existing code structure
- Add comments to new configurations
- Update documentation as needed
- Test before submitting

---

## 📄 License

MIT License - feel free to use and modify.

---

<div align="center">

**Happy Coding! 🎉**

Built with ❤️ for the Neovim community

![Neovim Logo](https://neovim.io/images/logo@2x.png)

</div>
