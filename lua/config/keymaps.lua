-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<A-j>", "j")
vim.keymap.set("i", "<A-k>", "k")
vim.keymap.set("v", "<A-j>", "j")
vim.keymap.set("v", "<A-k>", "k")
vim.keymap.set("n", "<A-j>", "j")
vim.keymap.set("n", "<A-k>", "k")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
