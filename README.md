# ABX Neovim

A minimalist Neovim configuration with ThePrimeagen-inspired styling and Catppuccin theme.

## The Special Things

### 🎨 ThePrimeagen-Style Theme
- **Catppuccin Mocha** with transparent background
- **CursorLine** highlighted with `#313244`
- **Minimal statusline** with colored diagnostic indicators
- **No borders** on popups and completion menus

### 🔧 Centralized Configuration
All settings in one file: `lua/abx/config.lua`

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

### ✨ Key Features
| Feature | Description |
|---------|-------------|
| Blink.cmp | Fast completion with snippets |
| LSP | Native Neovim LSP with diagnostic signs |
| Telescope | Fuzzy finder with fzf |
| Transparent UI | No background on popups/floats |
| Diagnostics | Circular indicators in statusline |

## Quick Start

```bash
# Backup existing
mv ~/.config/nvim ~/.config/nvim.backup

# Clone
git clone https://github.com/AbiXnash/nvim-2.0 ~/.config/nvim

# Open
nvim
```

## File Structure

```
lua/abx/
├── config.lua           # ← Centralized settings
├── init.lua             # Bootstrap
├── configs/
│   ├── options.lua      # vim.opt settings
│   ├── remaps.lua       # Keybindings
│   └── autocmd.lua      # Autocommands
├── core/
│   ├── lsp.lua          # LSP setup
│   └── lsp-keymaps.lua  # LSP keybindings
├── lsp/servers/         # LSP server configs
└── plugins/             # Plugin configurations
```

## Keybindings

| Key | Action |
|-----|--------|
| `<leader><leader>` | Find files |
| `gd` | Go to definition |
| `K` | Hover docs |
| `<leader>ca` | Code action |
| `[d` / `]d` | Prev/Next diagnostic |

## Customization

Edit `lua/abx/config.lua`:

```lua
-- Change cursorline color (default: #313244)
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#your-color" })

-- Change diagnostic icons
Config.lsp.diagnostic_signs = {
    error = "✗",
    warn = "!",
    info = "i",
    hint = "?",
}

-- Change theme colors in colorscheme.lua
color_overrides = {
    base = "#1e1e2e",
    mantle = "#181825",
}
```

## Requirements

- Neovim 0.10+
- Nerd Font (for icons)
- ripgrep (for Telescope)

## Credits

- [Catppuccin](https://github.com/catppuccin/nvim) - Theme
- [Blink.cmp](https://github.com/Saghen/blink.cmp) - Completion
- [ThePrimeagen](https://github.com/ThePrimeagen) - Styling inspiration
