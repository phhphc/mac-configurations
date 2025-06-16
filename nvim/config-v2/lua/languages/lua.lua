---@type LazySpec
return {
	"mason-org/mason-lspconfig.nvim",
	opts = function(_, opts)
		table.insert(opts.ensure_installed, "lua_ls")
	end,
}
