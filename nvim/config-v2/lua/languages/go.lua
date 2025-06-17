---@type LazySpec
return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "gopls" })
		end,
	},
}
