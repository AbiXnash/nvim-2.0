<div align="center">

# ABX Neovim

A minimalist Neovim configuration with ThePrimeagen-inspired styling and Catppuccin theme.

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/Lua-5.1-blue?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org/)
[![Catppuccin](https://img.shields.io/badge/Catppuccin-Mocha-pink?style=for-the-badge&logo=windowsterminal)](https://github.com/catppuccin/nvim)
[![Blink.cmp](https://img.shields.io/badge/Blink.cmp-yellow?style=for-the-badge&logo=neovim)](https://github.com/Saghen/blink.cmp)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Stars](https://img.shields.io/github/stars/AbiXnash/nvim?style=for-the-badge&logo=github)](https://github.com/AbiXnash/nvim-2.0/stargazers)

</div>

---

## The Special Things

### ThePrimeagen-Style Theme

| Feature | Description |
|---------|-------------|
| **Transparent UI** | No background on popups, floats, or completion menus |
| **CursorLine** | Full line highlight with `#313244` background |
| **Minimal Statusline** | Clean design with colored diagnostic indicators |
| **No Borders** | Borderless popups for a cleaner look |

### Centralized Configuration

All settings in one file: `lua/abx/config.lua`

```lua
Config.editor = {
    cursorlineopt = "both",  -- Full line highlight
    tabstop = 4,
    scrolloff = 20,
}

Config.lsp = {
    diagnostic_signs = {
        error = "E",
        warn = "W",
        info = "I",
        hint = "H",
    },
}
```

### Diagnostic Indicators

| Indicator | Meaning |
|-----------|---------|
| **●** (red) | Error |
| **●** (yellow) | Warning |
| **●** (blue) | Info |
| **●** (grey) | Hint |

---

## Quick Start

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repository
git clone https://github.com/AbiXnash/nvim-2.0 ~/.config/nvim

# Launch Neovim (plugins will install automatically)
nvim
```

## File Structure

```
nvim/
├── init.lua              # Entry point
├── README.md             # This file
├── LICENSE               # MIT License
│
└── lua/abx/              # Main configuration
    ├── config.lua        # ← Centralized settings
    ├── init.lua          # Bootstrap
    ├── configs/          # Editor settings
    ├── core/             # LSP setup
    ├── lsp/servers/      # LSP server configs
    └── plugins/          # Plugin configs
```

## Keybindings

### General

| Key | Mode | Action |
|-----|------|--------|
| `jk` | Insert | Exit insert mode |
| `<Esc>` | Normal | Clear search |
| `<C-c>` | Visual | Copy to clipboard |

### Dashboard

| Key | Action |
|-----|--------|
| `q` | Quit from dashboard |
| `<CR>` | Open selected entry |

### Surround

| Key | Mode | Action |
|-----|------|--------|
| `cs` | Normal | Change surrounding |
| `ds` | Normal | Delete surrounding |
| `ys` | Normal | Add surrounding |
| `S` | Visual | Surround selection |

### File & Window

| Key | Action |
|-----|--------|
| `<leader>pv` / `<leader>e` | File manager (oil.nvim) |
| `<C-h/j/k/l>` | Navigate windows |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover docs |
| `<leader>ca` | Code action |

### Telescope

| Key | Action |
|-----|--------|
| `<leader><leader>` | Find files |
| `<leader>fs` | Live grep |

### Diagnostics

| Key | Action |
|-----|--------|
| `[d` / `]d` | Prev/Next diagnostic |
| `<leader>xx` | Open Trouble |

---

## Customization

### Change CursorLine Color

```lua
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#45475a" })
```

### Change Diagnostic Icons

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

```lua
color_overrides = {
    base = "#1e1e2e",
    mantle = "#181825",
    crust = "#11111b",
}
```

---

## Plugins

| Category | Plugins |
|----------|---------|
| UI | Catppuccin, Blink.cmp, Lualine, Comment, Startify |
| Dashboard | vim-startify |
| File Manager | Oil.nvim |
| LSP | Native LSP, lspconfig, mason |
| Syntax | Treesitter |
| Format | Conform, none-ls |
| Git | Fugitive, gitsigns |

---

## Requirements

| Requirement | Version |
|-------------|---------|
| Neovim | 0.10+ |
| Nerd Font | Any |
| ripgrep | Latest |
| Git | Latest |

---

## Language Support

| Language | Server | Status |
|----------|--------|--------|
| Rust | rust_analyzer | ✅ |
| Python | basedpyright | ✅ |
| Go | gopls | ✅ |
| Java | jdtls | ✅ |
| TypeScript | typescript-tools | ✅ |
| Lua | lua_ls | ✅ |
| Svelte | svelte-language-server | ✅ |
| Astro | astro-language-server | ✅ |
| Kotlin | kotlin_language_server | ✅ |

---

## Commands

| Command | Description |
|---------|-------------|
| `:LspRestart` | Restart LSP |
| `:Mason` | Package manager |

---

## License

MIT License - see [LICENSE](LICENSE)

---

<div align="center">

Star this repo if you like it!

Made with ❤️ by [AbiXnash](https://github.com/AbiXnash)

[![GitHub followers](https://img.shields.io/github/followers/AbiXnash?style=for-the-badge&logo=github)](https://github.com/AbiXnash)

</div>
