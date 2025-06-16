return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	cmd = { "Telescope" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Find buffers" },
	},
}
