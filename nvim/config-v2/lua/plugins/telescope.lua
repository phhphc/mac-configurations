local event = require("lazy.core.handler.event")
---@type LazySpec[]
return {
	{
		event = "VeryLazy",
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Telescope" },
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		},

		-- TODO: install this plugin:
		-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
	},

	-- {
	-- 	lazy = false,
	-- 	"nvim-telescope/telescope-file-browser.nvim",
	-- 	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("telescope").load_extension("file_browser")
	-- 	end,
	-- 	keys = {
	-- 		{ "<leader>e", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File browser" },
	-- 	},
	-- },
}
