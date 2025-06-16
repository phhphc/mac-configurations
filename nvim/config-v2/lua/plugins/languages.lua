---@type LazySpec[]
return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {}, -- Prevent nil pointer error
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		import = "languages",
	},
}
