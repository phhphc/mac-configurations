-- remove neovim default lsp key binding
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grn")
vim.keymap.del({ "n", "x" }, "gra")
vim.keymap.del("n", "gri")

-- config spell
vim.opt.spell = false
vim.opt.spelllang = "en,vi"
