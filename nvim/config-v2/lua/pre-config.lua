-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable Neovim new keymap
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gra")

if vim.g.vscode then
	-- VSCode extension
	require("config.vscode")
else
	-- ordinary Neovim
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.scrolloff = 4

	vim.opt.winborder = "rounded"
end

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit window" })
vim.keymap.set("n", "<leader>Q", "<cmd>quitall<cr>", { desc = "Quit all windows" })
vim.keymap.set("n", "<leader>n", "<cmd>nohlsearch<cr>", { desc = "No hightlight search" })
