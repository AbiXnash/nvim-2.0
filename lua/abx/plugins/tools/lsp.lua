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
}
