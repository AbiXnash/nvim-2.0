# 🚀 ABX Neovim Configuration

A modern, well-organized Neovim configuration optimized for productivity and maintainability. This configuration features comprehensive LSP support, modern tooling, and a clean modular architecture.

## ✨ Features

### 🎯 Core Features

- **Modern Neovim Setup**: Built for Neovim 0.10+ with latest APIs
- **Modular Architecture**: Clean, organized structure with `lua/abx/` namespace
- **Lazy Plugin Manager**: Fast, efficient plugin management with lazy.nvim
- **Comprehensive LSP**: Full language server support with intelligent keymaps
- **Modern Completion**: `blink.cmp` for fast, accurate code completion

### 🛠️ Language Support

- **Lua** - `lua_ls`
- **Rust** - `rust_analyzer`
- **Python** - `basedpyright`
- **TypeScript/JavaScript** - `typescript`
- **Go** - `gopls`
- **Svelte** - `svelte`
- **Astro** - `astro`
- **JSON** - `jsonls`

### 🔥 Enhanced Go Development

- **go.nvim** - Enhanced Go development experience with struct generation
- **gopls** - Advanced LSP with gofumpt formatting and inlay hints
- **structgen.nvim** - Automatic struct generation with case conversion
- **neotest** - Go test runner integration
- **nvim-dap-go** - Debugging support with delve integration

### 🌟 Enhanced Framework Support

- **Enhanced Svelte** - Auto-imports, component creation, language tools
- **Enhanced Astro** - HTML template parsing, props hints, language server
- **Auto-tagging** - nvim-ts-autotag for HTML-like frameworks
- **CSS Colorizer** - Tailwind support with nvim-colorizer.lua

### 🎨 User Experience Improvements

- **Minimal Statusline** - Mode, git status, diagnostics, file info, and time
- **Session Persistence** - Auto-save/restore workspace sessions
- **Startup Profiling** - Performance monitoring and optimization analysis
- **Performance Optimization** - Lazy loading and caching optimizations

### 🎨 Editor Features

- **Syntax Highlighting**: Treesitter for enhanced syntax parsing
- **Git Integration**: Fugitive for Git operations
- **File Navigation**: Telescope fuzzy finder with multiple sources
- **Code Formatting**: Automatic format-on-save for multiple languages
- **Diagnostics**: Inline diagnostics withTrouble.nvim integration
- **Undo Tree**: Visual undo history with Undotree

## 📁 Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json             # Plugin lock file
├── lsp/                        # Individual LSP server configs
│   ├── astro.lua
│   ├── basedpyright.lua
│   ├── gopls.lua
│   ├── json_ls.lua
│   ├── lua_ls.lua
│   ├── pylsp.lua
│   ├── rust_analyzer.lua
│   ├── svelte.lua
│   └── typescript.lua
└── lua/abx/                   # Main configuration namespace
    ├── init.lua               # Core setup and lazy.nvim initialization
├── configs/               # Basic Neovim configurations
│   ├── autocmd.lua        # Auto commands
│   ├── options.lua        # Editor options and settings
│   └── remaps.lua         # Key mappings
├── core/                  # Core functionality
│   ├── lsp.lua            # Main LSP configuration
│   ├── lsp-attach.lua     # LSP attach handler
│   ├── lsp-keymaps.lua    # LSP keymap definitions
│   └── lsp-commands.lua   # Custom LSP commands
└── plugins/               # Plugin specifications
    ├── blink.lua          # Completion engine
    ├── colorscheme.lua    # Theme configuration
    ├── comments.lua       # Commenting plugin
    ├── formatters.lua     # Code formatting
    ├── lsp.lua            # LSP plugin specification
    ├── mason.lua          # LSP server manager
    ├── statusline.lua     # Minimal statusline
    ├── sessions.lua       # Session persistence
    ├── performance.lua    # Performance monitoring
    ├── python.lua         # Python-specific plugins
    ├── frameworks.lua    # Enhanced framework support
    ├── telescope.lua      # Fuzzy finder
    ├── treesitter.lua     # Syntax highlighting
    ├── trouble.lua        # Diagnostics viewer
    ├── undotree.lua       # Undo history
    └── web.lua            # Web development plugins
```

## ⌨️ Key Mappings

### 🔍 Navigation & Search

| Key                | Mode   | Description        |
| ------------------ | ------ | ------------------ |
| `<leader><leader>` | Normal | Find files         |
| `<leader>fg`       | Normal | Find git files     |
| `<leader>fs`       | Normal | Live grep (search) |
| `<leader>fb`       | Normal | Find buffers       |

### 💻 LSP (Language Server Protocol)

| Key          | Mode          | Description           |
| ------------ | ------------- | --------------------- |
| `gd`         | Normal        | Go to definition      |
| `gD`         | Normal        | Go to declaration     |
| `gi`         | Normal        | Go to implementation  |
| `gr`         | Normal        | Go to references      |
| `gt`         | Normal        | Go to type definition |
| `K`          | Normal        | Hover documentation   |
| `<C-k>`      | Normal/Insert | Signature help        |
| `<leader>ca` | Normal/Visual | Code action           |
| `<leader>rn` | Normal        | Rename symbol         |
| `<leader>cf` | Normal        | Format buffer         |

### 🔧 Diagnostics

| Key          | Mode   | Description                 |
| ------------ | ------ | --------------------------- |
| `[d`         | Normal | Previous diagnostic         |
| `]d`         | Normal | Next diagnostic             |
| `<leader>cd` | Normal | Show diagnostic float       |
| `<leader>cl` | Normal | Diagnostic to location list |
| `gl`         | Normal | Open diagnostic float       |

### 📂 File & Window Management

| Key          | Mode   | Description       |
| ------------ | ------ | ----------------- |
| `<leader>pv` | Normal | File tree (netrw) |
| `<C-h>`      | Normal | Window left       |
| `<C-j>`      | Normal | Window down       |
| `<C-k>`      | Normal | Window up         |
| `<C-l>`      | Normal | Window right      |

### ✏️ Editing

| Key     | Mode   | Description              |
| ------- | ------ | ------------------------ |
| `jk`    | Insert | Escape to normal mode    |
| `","`   | Visual | Move line down           |
| `"."`   | Visual | Move line up             |
| `<C-c>` | Visual | Copy to system clipboard |
| `<Esc>` | Normal | Clear search highlight   |

### 🎯 Git

| Key         | Mode   | Description           |
| ----------- | ------ | --------------------- | ------------- |
| `<leader>g` | Normal | Git status (Fugitive) | remaps.lua:45 |

## 🚀 Getting Started

### Prerequisites

- **Neovim 0.10+** (recommended latest stable)
- **Git** for plugin management
- **Ripgrep** (`rg`) for Telescope search functionality
- **Language servers** (automatically installed by Mason)

### ⌨️ Key Mappings

### Installation

1. **Backup existing configuration**

   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this configuration**

   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

3. **Launch Neovim**

   ```bash
   nvim
   ```

   Lazy.nvim will automatically install all plugins and language servers.

### Language Server Setup

The configuration uses **Mason** to manage language servers. Most common servers are automatically configured. To manually add servers:

1. Open Neovim
2. Run `:Mason` to see available servers
3. Install desired servers interactively

## 🔧 Customization

### Adding New Language Servers

1. **Install with Mason**: `:Mason` → select server
2. **Add to LSP config**: Edit `lua/abx/core/lsp.lua`:
   ```lua
   vim.lsp.enable({
       "lua_ls",
       "rust_analyzer",
       "your_new_server",
   })
   ```
3. **Create server config** (optional): Add file in `lsp/your_new_server.lua`

### Adding New Plugins

1. **Choose appropriate category** in `lua/abx/plugins/`
2. **Add plugin specification** following lazy.nvim format:
   ```lua
   return {
       "author/plugin-name",
       config = function()
           -- Plugin configuration
       end,
   }
   ```

### Custom Keymaps

Add custom keymaps to `lua/abx/configs/remaps.lua`:

```lua
vim.keymap.set("n", "<leader>your_key", "<cmd>YourCommand<CR>", {
    desc = "Your description"
})
```

For LSP-specific keymaps, modify `lua/abx/core/lsp-keymaps.lua`.

## 🛠️ Maintenance

### Updating Plugins

- **All plugins**: `:Lazy sync`
- **Specific plugin**: `:Lazy update plugin-name`

### LSP Management

- **List servers**: `:LspInstalled`
- **Show status**: `:LspStatus`
- **Show details**: `:LspDetails`
- **Restart LSP**: `:LspRestart`

### Troubleshooting

- **Check config**: Run `nvim --headless -c "lua require('abx')" -c "qa"`
- **Plugin issues**: `:Lazy` → check plugin status
- **LSP issues**: `:LspDetails` or `:LspLog`

## 🎨 Customization Tips

### Theme

Edit `lua/abx/plugins/colorscheme.lua` to change colorscheme:

```lua
return {
    "your/theme-name",
    config = function()
        vim.cmd("colorscheme your-theme")
    end,
}
```

### Options

Modify `lua/abx/configs/options.lua` for editor preferences:

```lua
vim.opt.number = true          -- Line numbers
vim.opt.relativenumber = true   -- Relative numbers
vim.opt.tabstop = 4            -- Tab width
-- ... more options
```

## 📚 Resources

### Learning Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Guide](https://github.com/folke/lazy.nvim)
- [LSP Configuration](https://neovim.io/doc/user/lsp.html)

### Community

- [Neovim Discord](https://discord.gg/neovim)
- [Reddit r/neovim](https://reddit.com/r/neovim)
- [Stack Overflow Neovim tag](https://stackoverflow.com/questions/tagged/neovim)

## 🤝 Contributing

Feel free to:

- Report issues with configuration
- Suggest improvements
- Share optimizations
- Contribute better configurations

## 📄 License

This configuration is provided as-is for educational and personal use.

---

**Happy Coding! 🎉**

Built with ❤️ for the Neovim community
