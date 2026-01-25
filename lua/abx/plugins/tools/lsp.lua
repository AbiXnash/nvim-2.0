-- =============================================================================
-- LSP Configuration and Management
-- =============================================================================
-- Core LSP setup with Mason package manager and Fidget notifications
-- Updated Jan 2026: Enhanced server management and progress notifications
-- =============================================================================

return {
	-- Main LSP configuration for Neovim
	"neovim/nvim-lspconfig",
	dependencies = {
		-- LSP package manager - ensures servers are installed
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	-- LSP progress notifications - shows what LSP servers are doing
	{
		"j-hui/fidget.nvim",
		version = "*", -- Use latest version
		opts = {},
	},
	config = function()
		local C = require("abx.config")
		-- Auto-install configured LSP servers
		require("mason-lspconfig").setup({
			ensure_installed = C.lsp.servers,
		})
	end,
}
