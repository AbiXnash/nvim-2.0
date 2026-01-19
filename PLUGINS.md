# Plugins Documentation

Complete list of all plugins used in this Neovim configuration.

---

## Plugin Index

| # | Plugin | Category | Description |
|---|--------|----------|-------------|
| 1 | lazy.nvim | core | Plugin manager |
| 2 | blink.cmp | ui | Code completion |
| 3 | LuaSnip | ui | Snippet engine |
| 4 | friendly-snippets | ui | Pre-built snippets |
| 5 | lspconfig | tools | LSP configuration |
| 6 | nvim-lspconfig | tools | LSP configurations |
| 7 | mason.nvim | tools | Package manager |
| 8 | telescope.nvim | tools | Fuzzy finder |
| 9 | telescope-fzf-native | tools | FZF sorter |
| 10 | telescope-file-browser | tools | File browser |
| 11 | oil.nvim | tools | File manager |
| 12 | nvim-treesitter | tools | Syntax highlighting |
| 13 | gitsigns.nvim | tools | Git signs |
| 14 | vim-fugitive | tools | Git commands |
| 15 | diffview.nvim | tools | Git diff viewer |
| 16 | nvim-dap | lang | Debug adapter protocol |
| 17 | neotest | tools | Test runner |
| 18 | conform.nvim | tools | Formatter |
| 19 | none-ls.nvim | tools | LSP formatter/linter |
| 20 | catppuccin | ui | Colorscheme |
| 21 | kanagawa | ui | Colorscheme |
| 22 | lualine | ui | Status line |
| 23 | Comment.nvim | ui | Comment toggling |
| 24 | trouble.nvim | tools | Diagnostics panel |
| 25 | undotree | tools | Undo history |
| 26 | persistence | tools | Session management |
| 27 | lazydev | lang | Lua development |
| 28 | typescript-tools | lang | TypeScript LSP |
| 29 | structrue-go | lang | Go struct handling |
| 30 | neotest-go | lang | Go test runner |
| 31 | nvim-dap-python | lang | Python debugger |
| 32 | nvim-dap-java | lang | Java debugger |
| 33 | venv-selector | lang | Python venv selector |
| 34 | nvim-ts-autotag | lang | Auto-close tags |
| 35 | nvim-highlight-colors | lang | Color highlighting |
| 36 | schemastore | lang | JSON schemas |
| 37 | tiny-inline-diagnostic | tools | Inline diagnostics |
| 38 | codesnap | ui | Code screenshots |
| 39 | eyeliner | ui | Keyword highlighting |
| 40 | todo-comments | ui | TODO highlighting |
| 41 | vim-sleuth | ui | Auto-indentation |

---

## Core Plugins

### [lazy.nvim](https://github.com/folke/lazy.nvim)

**Category:** core
**Purpose:** Fast, feature-rich plugin manager
**Configuration:** `lua/abx/init.lua`

```lua
require("lazy").setup({
    spec = { import = "abx.plugins" },
    checker = { enabled = false },
})
```

---

## UI Plugins

### [blink.cmp](https://github.com/Saghen/blink.cmp)

**Category:** ui
**Purpose:** Blazing fast code completion
**File:** `lua/abx/plugins/ui/blink.lua`

Features:
- LSP completion integration
- Snippet support (LuaSnip)
- Fuzzy matching
- Documentation popup

Keymaps:
- `<CR>` - Accept completion
- `<C-k>` - Signature help
- `<Tab>` - Navigate completions

---

### [LuaSnip](https://github.com/L3MON4D3/LuaSnip)

**Category:** ui
**Purpose:** Snippet engine
**File:** `lua/abx/plugins/ui/blink.lua`

Loaded with friendly-snippets for VS Code-style snippets.

---

### [catppuccin](https://github.com/catppuccin/nvim)

**Category:** ui
**Purpose:** Beautiful colorscheme
**File:** `lua/abx/plugins/ui/colorscheme.lua`

Flavor: Mocha
Features:
- Transparent background
- LSP integration
- Telescope integration
- Blink.cmp styling

---

### [kanagawa](https://github.com/rebelot/kanagawa.nvim)

**Category:** ui
**Purpose:** Alternative colorscheme
**File:** `lua/abx/plugins/ui/colorscheme.lua`

Themes: Dragon (dark), Lotus (light)

---

### [lualine](https://github.com/nvim-lualine/lualine.nvim)

**Category:** ui
**Purpose:** Status line
**File:** `lua/abx/plugins/ui/statusline.lua`

Components:
- Mode indicator
- Git branch
- Filename with path
- Diagnostics count
- File type
- Location/position

---

### [Comment.nvim](https://github.com/numToStr/Comment.nvim)

**Category:** ui
**Purpose:** Smart commenting
**File:** `lua/abx/plugins/ui/comments.lua`

Keymaps:
| Key | Description |
|-----|-------------|
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `gc` | Linewise operator |
| `gb` | Blockwise operator |

---

### [codesnap](https://github.com/mistricky/codesnap.nvim)

**Category:** ui
**Purpose:** Code screenshots
**File:** `lua/abx/plugins/ui/codesnap.lua`

Keymaps:
| Key | Description |
|-----|-------------|
| `<leader>cc` | Snap to clipboard |
| `<leader>cs` | Snap to Pictures |

---

## Development Tools

### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

**Category:** tools
**Purpose:** Fuzzy finder
**File:** `lua/abx/plugins/tools/telescope.lua`

Extensions: fzf-native, file_browser

Keymaps:
| Key | Description |
|-----|-------------|
| `<leader><leader>` | Find files |
| `<leader>fg` | Git files |
| `<leader>fs` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fd` | Diagnostics |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |

---

### [telescope-file-browser](https://github.com/nvim-telescope/telescope-file-browser.nvim)

**Category:** tools
**Purpose:** File browser for telescope
**File:** `lua/abx/plugins/tools/telescope.lua`

Features:
- File/folder browser with telescope UI
- Create, delete, rename, move files
- Toggle hidden files
- LSP integration for file operations

Keymaps:
| Key | Description |
|-----|-------------|
| `<leader>e` | Open file browser |
| `<CR>` | Select file |
| `-` | Go to parent |
| `h` | Toggle hidden |
| `c` | Create file/folder |
| `d` | Delete |
| `r` | Rename |
| `m` | Move |

---

### [oil.nvim](https://github.com/stevearc/oil.nvim)

**Category:** tools
**Purpose:** File manager with native Neovim UI
**File:** `lua/abx/plugins/tools/oil.lua`

Features:
- Native Neovim buffer (no external tools)
- Edit filesystem directly
- Navigate directories
- Create, delete, rename, move files
- Copy/paste files
- Supports symlinks

Keymaps:
| Key | Description |
|-----|-------------|
| `<leader>pv` / `<leader>e` | Open oil |
| `<CR>` | Open file/enter directory |
| `-` | Go to parent |
| `_` | Go to cwd |
| `~` | Go to home |
| `gx` | Open external |
| `g.` | Toggle hidden |
| `c` | Copy |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `p` | Paste |

Configuration in `lua/abx/plugins/tools/oil.lua`:
```lua
columns = { "icon" },
theme = "float",
popup_border = "single",
show_hidden = false,
```

---

### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

**Category:** tools
**Purpose:** Syntax highlighting and parsing
**File:** `lua/abx/plugins/tools/treesitter.lua`

Features:
- Syntax highlighting
- Text objects (function, class)
- Indentation
- Incremental selection

Installed languages (from `lua/abx/config.lua`):
- lua, vimdoc, java, jsdoc
- python, rust, javascript, typescript
- json, yaml, toml, css, html
- go, cpp, c, bash, markdown
- vue, svelte, astro, sql

---

### [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

**Category:** tools
**Purpose:** Git signs and actions
**File:** `lua/abx/plugins/tools/git.lua`

Features:
- Line signs (added, modified, removed)
- Hunk navigation
- Staging/unstaging
- Preview hunks
- Blame current line

Keymaps:
| Key | Description |
|-----|-------------|
| `]c` / `[c` | Next/Previous hunk |
| `<leader>ghs` | Stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghp` | Preview hunk |

---

### [vim-fugitive](https://github.com/tpope/vim-fugitive)

**Category:** tools
**Purpose:** Git commands
**File:** `lua/abx/plugins/tools/git.lua`

Keymaps:
| Key | Description |
|-----|-------------|
| `<leader>g` | Git status |

Commands:
| Command | Description |
|---------|-------------|
| `:G` | Git status buffer |
| `:G commit` | Commit changes |
| `:G push` | Push to remote |
| `:G pull` | Pull from remote |

---

### [diffview.nvim](https://github.com/sindrets/diffview.nvim)

**Category:** tools
**Purpose:** Git diff viewer in tabs
**File:** `lua/abx/plugins/tools/git.lua`

Commands:
| Command | Description |
|---------|-------------|
| `:DiffviewOpen` | Open diff view |
| `:DiffviewClose` | Close diff view |
| `:DiffviewFileHistory` | File history |

---

### [conform.nvim](https://github.com/stevearc/conform.nvim)

**Category:** tools
**Purpose:** Code formatting
**File:** `lua/abx/plugins/tools/formatters.lua`

Features:
- Auto-format on save
- Multiple formatters per filetype
- LSP fallback

Formatters by filetype:
| Filetype | Formatters |
|----------|------------|
| lua | prettierd |
| typescript | prettierd |
| python | black |
| go | gofumpt, goimports |
| java | google-java-format |
| rust | rustfmt |
| json/markdown/html/css | prettierd |

Configuration in `lua/abx/config.lua`:
```lua
Config.formatters = {
    prettier_args = { "--tab-width", "4", "--use-tabs", "false" },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
}
```

---

### [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)

**Category:** tools
**Purpose:** LSP formatter and linter
**File:** `lua/abx/plugins/tools/formatters.lua`

Sources:
- Formatting: prettierd, gofumpt, goimports, google-java-format
- Linting: eslint_d, golangci-lint, checkstyle

---

### [mason.nvim](https://github.com/williamboman/mason.nvim)

**Category:** tools
**Purpose:** LSP package manager
**File:** `lua/abx/plugins/tools/mason.lua`

Command: `:Mason`

Installed tools:
- LSP: gopls, basedpyright, jdtls, lua_ls, rust_analyzer
- Formatters: black, gofumpt, prettierd, rustfmt
- Linters: eslint_d, golangci-lint, shellcheck
- Debuggers: debugpy, delve, java-debug-adapter

---

### [trouble.nvim](https://github.com/folke/trouble.nvim)

**Category:** tools
**Purpose:** Diagnostics panel
**File:** `lua/abx/plugins/tools/trouble.lua`

Keymaps:
| Key | Description |
|-----|-------------|
| `<leader>xx` | Open Trouble |
| `<leader>xX` | Buffer diagnostics |
| `<leader>cs` | Symbols |
| `<leader>cl` | References |

---

### [persistence](https://github.com/folke/persistence.nvim)

**Category:** tools
**Purpose:** Session management
**File:** `lua/abx/plugins/tools/sessions.lua`

Features:
- Auto-save on exit
- Auto-load on startup
- Manual save/load/delete

Keymaps:
| Key | Description |
|-----|-------------|
| `<leader>ss` | Save session |
| `<leader>sl` | Load session |
| `<leader>sd` | Delete session |

---

### [undotree](https://github.com/mbbill/undotree)

**Category:** tools
**Purpose:** Visual undo history
**File:** `lua/abx/plugins/tools/undotree.lua`

Keymaps:
| Key | Description |
|-----|-------------|
| `<leader>U` | Toggle undo tree |

---

### [tiny-inline-diagnostic](https://github.com/xxnity/tiny-inline-diagnostic.nvim)

**Category:** tools
**Purpose:** Inline diagnostics
**File:** `lua/abx/plugins/tools/inline-diagnostics.lua`

Replaces virtual text diagnostics with inline messages.

---

## Language Plugins

### [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim)

**Category:** lang
**Purpose:** TypeScript/JavaScript LSP
**File:** `lua/abx/plugins/lang/web.lua`

Features:
- Organize imports
- Add missing imports
- Remove unused imports
- JSX close tags
- Inlay hints

Keymaps:
| Key | Description |
|-----|-------------|
| `<leader>oi` | Organize imports |
| `<leader>ai` | Add missing imports |
| `<leader>ru` | Remove unused |

---

### [structrue-go.nvim](https://github.com/crusj/structrue-go.nvim)

**Category:** lang
**Purpose:** Go struct handling
**File:** `lua/abx/plugins/lang/go-dev.lua`

Features:
- Generate struct from JSON/YAML
- Convert case (camel, snake, pascal)
- Generate methods

---

### [neotest-go](https://github.com/nvim-neotest/neotest-go)

**Category:** lang
**Purpose:** Go test runner
**File:** `lua/abx/plugins/lang/go-dev.lua`

Keymaps:
| Key | Description |
|-----|-------------|
| `<leader>gt` | Run nearest test |
| `<leader>gT` | Run all tests in file |
| `<leader>gs` | Test summary |
| `<leader>go` | Test output |

---

### [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)

**Category:** lang
**Purpose:** Python debugger
**File:** `lua/abx/plugins/lang/python.lua`

Setup: Auto-detects Python (conda, venv, system)

---

### [venv-selector](https://github.com/linux-cultist/venv-selector.nvim)

**Category:** lang
**Purpose:** Python virtual environment selector
**File:** `lua/abx/plugins/lang/python.lua`

Keymaps:
| Key | Description |
|-----|-------------|
| `<leader>dv` | Select venv |

---

### [nvim-dap-java](https://github.com/mfussenegger/nvim-dap-java)

**Category:** lang
**Purpose:** Java debugger
**File:** `lua/abx/plugins/lang/java.lua`

Configuration: Auto-configured for JDTLS

Keymaps:
| Key | Description |
|-----|-------------|
| `<leader>dc` | Continue |
| `<leader>db` | Toggle breakpoint |
| `<leader>ds` | Step over |
| `<leader>di` | Step into |
| `<leader>do` | Step out |

---

## LSP Server Configurations

LSP server configurations are located in `lua/abx/lsp/servers/`:

| File | Server | Language |
|------|--------|----------|
| `lua_ls.lua` | lua-language-server | Lua |
| `gopls.lua` | gopls | Go |
| `basedpyright.lua` | basedpyright | Python |
| `jdtls.lua` | jdtls | Java |
| `rust_analyzer.lua` | rust-analyzer | Rust |
| `typescript.lua` | typescript-language-server | TypeScript |
| `svelte.lua` | svelte-language-server | Svelte |
| `astro.lua` | astro-language-server | Astro |
| `json_ls.lua` | json-lsp | JSON |
| `html.lua` | html-lsp | HTML |
| `yamlls.lua` | yaml-language-server | YAML |
| `tailwindcss.lua` | tailwindcss-language-server | Tailwind CSS |
| `htmx.lua` | htmx-lsp | HTMX |
| `xml.lua` | lemminx | XML |
| `sql.lua` | sql-language-server | SQL |
| `marksman.lua` | marksman | Markdown |
| `kotlin.lua` | kotlin-language-server | Kotlin |

---

## Resources

- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim)
- [Neovim Plugins](https://neovim.io/doc/user/usr_05.html#plugin)
- [Lazy.nvim Wiki](https://github.com/folke/lazy.nvim/wiki)

---

*Last updated: January 2026*
