# 🚀 ABX Neovim Configuration

A modern, well-organized Neovim configuration optimized for productivity and maintainability. This configuration features comprehensive LSP support, modern tooling, and a clean modular architecture built for Neovim 0.10+.

## ✨ Features

### 🎯 Core Features

- **Modern Neovim Setup**: Built for Neovim 0.10+ with latest APIs and capabilities
- **Modular Architecture**: Clean, organized structure with `lua/abx/` namespace
- **Lazy Plugin Manager**: Fast, efficient plugin management with lazy.nvim
- **Comprehensive LSP**: Full language server support with intelligent keymaps and capabilities
- **Modern Completion**: `blink.cmp` for fast, accurate code completion with snippets
- **Session Persistence**: Auto-save/restore workspace sessions with persistence.nvim
- **Performance Monitoring**: Built-in profiling and performance optimization

### 🛠️ Language Support

- **Lua** - `lua_ls` with enhanced completion and documentation
- **Rust** - `rust_analyzer` with rustfmt integration
- **Python** - `basedpyright` with advanced type checking and debugging support
- **TypeScript/JavaScript** - Enhanced `typescript-tools.nvim` with JSDoc support
- **Go** - `gopls` with gofumpt formatting, inlay hints, and advanced analysis
- **Svelte** - `svelte` language server with component support
- **Astro** - `astro` language server with HTML template parsing
- **JSON** - `jsonls` with schema validation

### 🔥 Enhanced Go Development

- **gopls Integration**: Advanced LSP with gofumpt formatting, inlay hints, and comprehensive static analysis
- **Struct Generation**: `structrue-go.nvim` for automatic struct generation with case conversion (camel/snake/pascal)
- **Test Runner**: `neotest` with Go adapter for comprehensive test management
- **Code Quality**: golangci-lint integration with custom rules and auto-format on save
- **Debugging**: Delve debugger integration through nvim-dap-go
- **Key Features**:
  - Auto-import completion and organization
  - Interface implementation suggestions
  - Fill struct fields automatically
  - Generate unit tests and benchmarks

### 🌟 Enhanced Framework Support

- **TypeScript Tools**: Enhanced TS/JS experience with `typescript-tools.nvim`
  - JSDoc support with full documentation generation
  - Inlay hints for parameter names, types, and return values
  - Auto-import organization and unused import removal
  - JSX close tag completion
- **Svelte Integration**: Full component development support
  - Auto-imports for components and stores
  - Language server integration with TypeScript compilation
  - Component creation templates and props hints
- **Astro Support**: HTML template parsing and props hints
- **Auto-tagging**: `nvim-ts-autotag` for HTML-like frameworks (JSX, TSX, Vue)
- **CSS Colorizer**: `nvim-highlight-colors` with Tailwind support

### 🎨 User Experience Improvements

- **Premium Statusline**: Custom transparent statusline with developer-friendly colors
  - Mode indicator with bold styling
  - Git branch status
  - Current filename and diagnostics count
  - Filetype and cursor position
  - Transparent background matching theme
- **Session Persistence**: Automatic session management with persistence.nvim
  - Auto-save on exit and auto-load on startup
  - Session commands: `<leader>ss` (save), `<leader>sl` (load), `<leader>sd` (delete)
  - Preserves buffers, folds, tabpages, and window sizes
- **Inline Diagnostics**: Clean inline diagnostics with `tiny-inline-diagnostic.nvim`
  - Replaces virtual text with elegant inline messages
  - Color-coded by severity with icons
- **Code Snapshots**: `codesnap.nvim` for beautiful code screenshots
  - Save to clipboard (`<leader>cc`) or Pictures folder (`<leader>cs`)
  - Breadcrumb navigation and custom themes

### 🎨 Editor Features

- **Syntax Highlighting**: Treesitter with 20+ languages and auto-install
- **Git Integration**: Fugitive for Git operations and Gitsigns for inline diffs
- **File Navigation**: Telescope fuzzy finder with multiple sources
- **Code Formatting**: Automatic format-on-save with conform.nvim for 15+ languages
- **Diagnostics**: Enhanced with Trouble.nvim for comprehensive error management
- **Undo Tree**: Visual undo history with Undotree
- **Smart Comments**: Context-aware commenting with Comment.nvim
- **Todo Management**: TODO highlighting with todo-comments.nvim

## 📁 Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point (require "abx")
├── lazy-lock.json             # Plugin lock file with pinned versions
├── lsp/                        # Individual LSP server configurations
│   ├── astro.lua              # Astro language server setup
│   ├── basedpyright.lua       # Python type checker
│   ├── gopls.lua              # Go language server with advanced settings
│   ├── json_ls.lua            # JSON language server
│   ├── lua_ls.lua             # Lua language server
│   ├── pylsp.lua              # Alternative Python LSP
│   ├── rust_analyzer.lua      # Rust language server
│   ├── svelte.lua             # Svelte language server
│   └── typescript.lua         # TypeScript language server
└── lua/abx/                   # Main configuration namespace
    ├── init.lua               # Core setup and lazy.nvim initialization
    ├── configs/               # Basic Neovim configurations
    │   ├── autocmd.lua        # Auto commands (yank highlight, Python format)
    │   ├── options.lua        # Editor options and settings (60 lines)
    │   └── remaps.lua         # Key mappings (46 lines)
    ├── core/                  # Core LSP functionality
    │   ├── lsp.lua            # Main LSP configuration with enabled servers
    │   ├── lsp-attach.lua     # LSP attach handler with inlay hints and formatting
    │   ├── lsp-keymaps.lua    # Comprehensive LSP keymap definitions (53 lines)
    │   └── lsp-commands.lua   # Custom LSP commands (292 lines of utilities)
    └── plugins/               # Plugin specifications (20+ plugin files)
        ├── blink.lua          # Modern completion engine
        ├── colorscheme.lua    # Dual theme setup (Kanagawa + Catppuccin)
        ├── comments.lua       # Smart commenting with context awareness
        ├── formatters.lua     # Multi-language formatting (conform.nvim)
        ├── lsp.lua            # LSP base plugins (nvim-lspconfig, fidget.nvim)
        ├── mason.lua          # LSP server manager with auto-install
        ├── statusline.lua     # Custom transparent statusline
        ├── sessions.lua       # Session persistence with auto-save
        ├── python.lua         # Python-specific plugins (DAP, Jupytnium)
        ├── web.lua            # Web development (TypeScript tools, autotag)
        ├── telescope.lua      # Fuzzy finder with custom mappings
        ├── treesitter.lua     # Syntax highlighting with smart disable
        ├── trouble.lua        # Diagnostics viewer
        ├── undotree.lua       # Visual undo history
        ├── go-dev.lua         # Go development tools
        ├── git.lua            # Git integration
        ├── inline-diagnostics.lua # Clean inline diagnostics
        └── codesnap.lua       # Code screenshot utility
```

## ⌨️ Key Mappings

### 🔍 Navigation & Search (Telescope)

| Key                | Mode   | Description        |
| ------------------ | ------ | ------------------ |
| `<leader><leader>` | Normal | Find files         |
| `<leader>fg`       | Normal | Find git files     |
| `<leader>fs`       | Normal | Live grep (search) |
| `<leader>fb`       | Normal | Find buffers       |

### 💻 LSP (Language Server Protocol)

| Key          | Mode          | Description                       |
| ------------ | ------------- | --------------------------------- |
| `gd`         | Normal        | Go to definition                  |
| `gD`         | Normal        | Go to declaration                 |
| `gi`         | Normal        | Go to implementation              |
| `gr`         | Normal        | Go to references                  |
| `gt`         | Normal        | Go to type definition             |
| `K`          | Normal        | Hover documentation               |
| `<C-k>`      | Normal/Insert | Signature help                    |
| `<leader>ca` | Normal/Visual | Code action                       |
| `<leader>rn` | Normal        | Rename symbol                     |
| `<leader>cf` | Normal        | Format buffer                     |
| `<leader>v`  | Normal        | Goto Definition in Vertical Split |

### 🔧 Diagnostics

| Key          | Mode   | Description                 |
| ------------ | ------ | --------------------------- |
| `[d`         | Normal | Previous diagnostic         |
| `]d`         | Normal | Next diagnostic             |
| `<leader>cd` | Normal | Show diagnostic float       |
| `<leader>cl` | Normal | Diagnostic to location list |
| `gl`         | Normal | Open diagnostic float       |

### 🧪 Go Development

| Key          | Mode   | Description           |
| ------------ | ------ | --------------------- |
| `<leader>gt` | Normal | Run nearest test      |
| `<leader>gT` | Normal | Run all tests in file |
| `<leader>gs` | Normal | Test summary panel    |
| `<leader>go` | Normal | Test output panel     |

### 📂 File & Window Management

| Key          | Mode   | Description              |
| ------------ | ------ | ------------------------ |
| `<leader>pv` | Normal | File tree (netrw)        |
| `<C-h>`      | Normal | Window left              |
| `<C-j>`      | Normal | Window down              |
| `<C-k>`      | Normal | Window up                |
| `<C-l>`      | Normal | Window right             |
| `<C-up>`     | Normal | Split explore above      |
| `<C-down>`   | Normal | Horizontal explore below |
| `<C-left>`   | Normal | Vertical explore left    |

### ✏️ Editing

| Key         | Mode          | Description              |
| ----------- | ------------- | ------------------------ |
| `jk`        | Insert        | Escape to normal mode    |
| `","`       | Visual        | Move line down           |
| `"."`       | Visual        | Move line up             |
| `<C-c>`     | Visual        | Copy to system clipboard |
| `<Esc>`     | Normal        | Clear search highlight   |
| `gcc`       | Normal        | Toggle comment line      |
| `gbc`       | Normal        | Toggle comment block     |
| `<leader>/` | Normal/Visual | Toggle comment (leader)  |

### 🎯 Git & Sessions

| Key          | Mode   | Description                     |
| ------------ | ------ | ------------------------------- |
| `<leader>g`  | Normal | Git status (Fugitive)           |
| `<leader>ss` | Normal | Save session                    |
| `<leader>sl` | Normal | Load last session               |
| `<leader>sd` | Normal | Delete session                  |
| `<leader>sp` | Normal | Load last session (persistence) |

### 🛠️ Utilities

| Key          | Mode   | Description                  |
| ------------ | ------ | ---------------------------- |
| `<leader>U`  | Normal | Toggle undo tree             |
| `<leader>cc` | Visual | Code snap to clipboard       |
| `<leader>cs` | Visual | Code snap to Pictures        |
| `<leader>xx` | Normal | Open Trouble diagnostics     |
| `<leader>xX` | Normal | Buffer diagnostics (Trouble) |
| `<leader>cs` | Normal | Symbols (Trouble)            |
| `<leader>cl` | Normal | LSP references (Trouble)     |

### 🌐 TypeScript/JavaScript Tools

| Key          | Mode   | Description           |
| ------------ | ------ | --------------------- |
| `<leader>oi` | Normal | Organize imports      |
| `<leader>ai` | Normal | Add missing imports   |
| `<leader>ru` | Normal | Remove unused imports |

## 🚀 Getting Started

### Prerequisites

- **Neovim 0.10+** (recommended latest stable)
- **Git** for plugin management
- **Ripgrep** (`rg`) for Telescope search functionality
- **Language servers** (automatically installed by Mason)
- **Node.js & npm** for web development tools
- **Python 3+** with debugpy for Python debugging
- **Go** for Go development support

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

The configuration uses **Mason** to manage language servers. Most common servers are automatically configured:

**Auto-installed servers:**

- Go: `gopls`, `gofumpt`, `golangci-lint`, `delve`
- Web: `typescript-language-server`, `svelte-language-server`, `astro-language-server`
- Others: `prettierd`, `eslint_d`

To manually add servers:

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
- **Show capabilities**: `:LspCapabilities`
- **Show diagnostics**: `:LspDiagnostics`
- **Comprehensive info**: `:LspDetails`

### Session Management

- **Save session**: `:SessionSave` or `<leader>ss`
- **Load session**: `:SessionLoad` or `<leader>sl`
- **Delete session**: `:SessionDelete` or `<leader>sd`
- **Auto-save/load**: Automatically configured

### Troubleshooting

- **Check config**: Run `nvim --headless -c "lua require('abx')" -c "qa"`
- **Plugin issues**: `:Lazy` → check plugin status
- **LSP issues**: `:LspDetails` or `:LspLog`
- **Performance**: Check startup time with `nvim --startuptime`

## 🎨 Customization Tips

### Theme

The configuration includes dual theme support:

- **Primary**: Catppuccin (mocha flavor) with transparent background
- **Alternative**: Kanagawa (dragon theme) for variety

Edit `lua/abx/plugins/colorscheme.lua` to change:

```lua
vim.cmd.colorscheme "catppuccin"  -- or "kanagawa"
```

### Options

Modify `lua/abx/configs/options.lua` for editor preferences:

```lua
vim.opt.number = true          -- Line numbers
vim.opt.relativenumber = true   -- Relative numbers
vim.opt.tabstop = 4            -- Tab width
vim.opt.scrolloff = 20         -- Keep 20 lines visible
-- ... more options (60 total)
```

### Formatters

Edit `lua/abx/plugins/formatters.lua` for formatting preferences:

```lua
formatters_by_ft = {
  go = { "gofumpt", "goimports" },
  python = { "black" },
  typescript = { "prettierd" },
  -- Add your formatters here
}
```

## 📚 Resources

### Learning Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Guide](https://github.com/folke/lazy.nvim)
- [LSP Configuration](https://neovim.io/doc/user/lsp.html)
- [Blink.cmp Completion](https://github.com/Saghen/blink.cmp)

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

Configuration contains 2000+ lines of carefully crafted Lua code with comprehensive documentation and intelligent defaults.
