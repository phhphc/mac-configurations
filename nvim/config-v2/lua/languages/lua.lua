---@type LazySpec
return {
	"mason-org/mason-lspconfig.nvim",
	opts = function(_, opts)
		opts.ensure_installed = table.insert(opts.ensure_installed, "lua_ls")
	end,
}
