return {
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
  },
  -- Formatting
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "prettierd" },
          javascript = { "prettierd" },
          typescript = { "prettierd" },
          svelte = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescriptreact = { "prettierd" },
          python = { "black" },
          go = { "gofumpt", "goimports" },
          json = { "prettierd" },
          jsonc = { "prettierd" },
          markdown = { "prettierd" },
          html = { "prettierd" },
          htmx = { "prettierd" },
          css = { "prettierd" },
          scss = { "prettierd" },
          less = { "prettierd" },
          tailwindcss = { "prettierd", "tailwindcss-formatter" },
          yaml = { "prettierd" },
          astro = { "prettierd" },
          java = { "google-java-format" },
          rust = { "rustfmt" },
          c = { "clang-format" },
          cpp = { "clang-format" },
        },
        -- Formatter options for 4-space indentation
        formatters = {
          prettierd = {
            args = { "--tab-width", "4", "--use-tabs", "false" },
          },
          google_java_format = {
            args = { "--aosp", "--line-length=100" },
          },
        },
        format_on_save = { timeout_ms = 500, lsp_fallback = true },
      })
    end,
  },

  -- Linting
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim", -- Required for migrated sources like eslint_d
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.diagnostics.golangci_lint"),
        require("none-ls.diagnostics.checkstyle"),
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.google_java_format,
      },
    })
  end,
}
