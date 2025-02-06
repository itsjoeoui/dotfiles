-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.colorcolumn = "80"
vim.g.root_spec = { "cwd" }

opt.smartcase = false

vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "rubocop"

vim.g.snacks_animate = false

vim.o.statuscolumn = "%s %l %r"

vim.g.lazyvim_python_lsp = "basedpyright"
