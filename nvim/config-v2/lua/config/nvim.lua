-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.vscode then
	-- VSCode extension
	require("config.vscode")
else
	-- ordinary Neovim
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.scrolloff = 4
end
