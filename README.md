<div align="center">

# ABX Neovim

<img src="https://raw.githubusercontent.com/AbiXnash/nvim-2.0/master/assets/logo.svg" alt="ABX Neovim Logo" width="200" height="200">

A minimalist Neovim configuration with ThePrimeagen-inspired styling and Catppuccin theme.

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/Lua-5.1-blue?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org/)
[![Catppuccin](https://img.shields.io/badge/Catppuccin-Mocha-pink?style=for-the-badge&logo=windowsterminal)](https://github.com/catppuccin/nvim)
[![Blink.cmp](https://img.shields.io/badge/Blink.cmp-yellow?style=for-the-badge&logo=neovim)](https://github.com/Saghen/blink.cmp)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Stars](https://img.shields.io/github/stars/AbiXnash/nvim?style=for-the-badge&logo=github)](https://github.com/AbiXnash/nvim-2.0/stargazers)

<img src="https://raw.githubusercontent.com/AbiXnash/nvim-2.0/master/assets/screenshot.png" alt="ABX Neovim Screenshot" width="800">

</div>

---

## ✨ The Special Things

### 🎨 ThePrimeagen-Style Theme

<div align="center">

| Feature | Description |
|---------|-------------|
| 🖼️ **Transparent UI** | No background on popups, floats, or completion menus |
| 📍 **CursorLine** | Full line highlight with `#313244` background |
| 📊 **Minimal Statusline** | Clean design with colored diagnostic indicators |
| 🚫 **No Borders** | Borderless popups for a cleaner look |

</div>

### 🔧 Centralized Configuration

All settings in one file: [`lua/abx/config.lua`](lua/abx/config.lua)

```lua
Config.editor = {
    cursorlineopt = "both",  -- Full line highlight
    tabstop = 4,
    scrolloff = 20,
}

Config.lsp = {
    diagnostic_signs = {
        error = "",
        warn = "",
        info = "",
        hint = "󰌵",
    },
}
```

### 📊 Diagnostic Indicators

<div align="center">

<span style="color: #f38ba8">●</span> Error &nbsp;&nbsp;
<span style="color: #f9e2af">●</span> Warning &nbsp;&nbsp;
<span style="color: #89dceb">●</span> Info &nbsp;&nbsp;
<span style="color: #6c7086">●</span> Hint

</div>

---

## 🚀 Quick Start

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repository
git clone https://github.com/AbiXnash/nvim-2.0 ~/.config/nvim

# Launch Neovim (plugins will install automatically)
nvim
```

---

## 📁 File Structure

```
nvim/
├── init.lua                    # Entry point
├── README.md                   # This file
├── LICENSE                     # MIT License
│
└── lua/abx/                    # Main configuration namespace
    ├── config.lua              # ← Centralized settings (THE MOST IMPORTANT FILE)
    ├── init.lua                # Bootstrap & lazy.nvim setup
    │
    ├── configs/                # Core editor settings
    │   ├── options.lua         # vim.opt settings
    │   ├── remaps.lua          # Key mappings
    │   └── autocmd.lua         # Autocommands
    │
    ├── core/                   # LSP & core functionality
    │   ├── lsp.lua             # Main LSP configuration
    │   ├── lsp-attach.lua      # LSP attach handlers
    │   ├── lsp-keymaps.lua     # LSP keybindings
    │   └── lsp-commands.lua    # Custom LSP commands
    │
    ├── lsp/servers/            # LSP server configurations
    │   ├── lua_ls.lua          # Lua
    │   ├── gopls.lua           # Go
    │   ├── basedpyright.lua    # Python
    │   ├── jdtls.lua           # Java
    │   └── ...
    │
    └── plugins/                # Plugin configurations
        ├── init.lua            # Main plugins entry
        │
        ├── lang/               # Language-specific plugins
        │   ├── go-dev.lua      # Go development
        │   ├── java.lua        # Java development
        │   ├── python.lua      # Python development
        │   └── web.lua         # Web development
        │
        ├── ui/                 # User interface plugins
        │   ├── blink.lua       # Code completion
        │   ├── colorscheme.lua # Theme
        │   ├── statusline.lua  # Status line
        │   └── comments.lua    # Comment utilities
        │
        └── tools/              # Development utilities
            ├── telescope.lua   # Fuzzy finder
            ├── git.lua         # Git integration
            ├── treesitter.lua  # Syntax highlighting
            └── formatters.lua  # Code formatters
```

---

## ⌨️ Keybindings

### General

| Key | Mode | Action |
|-----|------|--------|
| `jk` | Insert | Exit insert mode |
| `<Esc>` | Normal | Clear search highlight |
| `<C-c>` | Visual | Copy to clipboard |

### File & Window

| Key | Action |
|-----|--------|
| `<leader>pv` | File tree (netrw) |
| `<C-h/j/k/l>` | Navigate windows |

### LSP Navigation

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |

### Telescope

| Key | Action |
|-----|--------|
| `<leader><leader>` | Find files |
| `<leader>fg` | Git files |
| `<leader>fs` | Live grep |
| `<leader>fb` | Find buffers |

### Diagnostics

| Key | Action |
|-----|--------|
| `[d` / `]d` | Prev/Next diagnostic |
| `<leader>cd` | Show diagnostic float |
| `<leader>xx` | Open Trouble panel |

---

## 🎛️ Customization

### Change CursorLine Color

Edit [`lua/abx/config.lua`](lua/abx/config.lua) or add to your config:

```lua
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#45475a" })
```

### Change Diagnostic Icons

In [`lua/abx/config.lua`](lua/abx/config.lua):

```lua
Config.lsp = {
    diagnostic_signs = {
        error = "✗",
        warn = "!",
        info = "i",
        hint = "?",
    },
}
```

### Change Theme Colors

Edit [`lua/abx/plugins/ui/colorscheme.lua`](lua/abx/plugins/ui/colorscheme.lua):

```lua
color_overrides = {
    base = "#1e1e2e",
    mantle = "#181825",
    crust = "#11111b",
    rosewater = "#f5e0dc",
    red = "#f38ba8",
    yellow = "#f9e2af",
    green = "#a6e3a1",
    blue = "#89b4fa",
}
```

### Add New LSP Server

1. Install with Mason: `:MasonInstall your-server`
2. Add to [`lua/abx/config.lua`](lua/abx/config.lua):

```lua
Config.lsp.servers = {
    "lua_ls",
    "gopls",
    "your-server",  -- Add here
}
```

3. Create config in [`lua/abx/lsp/servers/your_server.lua`](lua/abx/lsp/servers/):

```lua
return {
    cmd = { "your-server" },
    filetypes = { "your-lang" },
    root_markers = { "your-marker" },
}
```

---

## 📦 Plugins Used

<div align="center">

| Category | Plugins |
|----------|---------|
| 🎨 **UI** | Catppuccin, Blink.cmp, Lualine, Comment.nvim |
| 🔍 **Search** | Telescope, FZF |
| 🧩 **Completion** | Blink.cmp, LuaSnip |
| 🛠️ **LSP** | Native LSP, lspconfig, mason |
| 🌳 **Syntax** | Treesitter |
| 📝 **Format** | Conform, none-ls |
| 🔀 **Git** | Fugitive, gitsigns, diffview |

</div>

---

## 📋 Requirements

| Requirement | Version | Description |
|-------------|---------|-------------|
| **Neovim** | 0.10+ | Latest stable recommended |
| **Nerd Font** | Any | For icons and symbols |
| **ripgrep** | Latest | For Telescope live grep |
| **Git** | Latest | For plugin management |

### Install ripgrep

```bash
# macOS
brew install ripgrep

# Linux (Debian/Ubuntu)
sudo apt install ripgrep

# Linux (Arch)
sudo pacman -S ripgrep
```

---

## 🎯 Language Support

<div align="center">

| Language | Server | Status |
|----------|--------|--------|
| 🦀 Rust | rust_analyzer | ✅ |
| 🐍 Python | basedpyright | ✅ |
| 🐹 Go | gopls | ✅ |
| ☕ Java | jdtls | ✅ |
| 🟦 TypeScript | typescript-tools | ✅ |
| 🌙 Lua | lua_ls | ✅ |
| 🟨 JavaScript | typescript-tools | ✅ |
| ⚛️ Svelte | svelte-language-server | ✅ |
| 🚀 Astro | astro-language-server | ✅ |
| 🟢 Kotlin | kotlin_language_server | ✅ |
| 📄 Markdown | marksman | ✅ |
| 📊 JSON | jsonls | ✅ |
| 🧶 YAML | yamlls | ✅ |
| 🌐 HTML | html | ✅ |
| 🎨 CSS/Tailwind | tailwindcss | ✅ |

</div>

---

## 📝 Commands

### LSP Commands

| Command | Description |
|---------|-------------|
| `:LspRestart` | Restart LSP servers |
| `:LspStatus` | Show LSP status |
| `:LspDiagnostics` | Diagnostic counts |
| `:Mason` | Package manager UI |

### Session Commands

| Command | Description |
|---------|-------------|
| `<leader>ss` | Save session |
| `<leader>sl` | Load session |
| `<leader>sd` | Delete session |

---

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

---

## 📄 License

MIT License - feel free to use and modify.

See [LICENSE](LICENSE) for details.

---

<div align="center">

### ⭐ Star this repo if you like it!

Made with ❤️ by [AbiXnash](https://github.com/AbiXnash)

[![GitHub followers](https://img.shields.io/github/followers/AbiXnash?style=for-the-badge&logo=github)](https://github.com/AbiXnash)
[![GitHub Repo stars](https://img.shields.io/github/stars/AbiXnash/nvim-2.0?style=for-the-badge&logo=github)](https://github.com/AbiXnash/nvim-2.0/stargazers)

<img src="https://raw.githubusercontent.com/AbiXnash/nvim-2.0/master/assets/neovim.svg" alt="Neovim Logo" width="100">

</div>
