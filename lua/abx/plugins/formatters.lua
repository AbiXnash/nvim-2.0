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
          go = { "gofumpt" },
          json = { "prettierd" },
          jsonc = { "prettierd" },
          markdown = { "prettierd" },
          html = { "prettierd" },
          css = { "prettierd" },
          yaml = { "prettierd" },
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
        null_ls.builtins.formatting.prettierd,
      },
    })
  end,
}
