return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"j-hui/fidget.nvim",
		version = "*", -- alternatively, pin this to a specific version, e.g., "1.6.1"
		opts = {},
	},
	config = function()
		local C = require("abx.config")
		require("mason-lspconfig").setup({
			ensure_installed = C.lsp.servers,
		})
	end,
}
