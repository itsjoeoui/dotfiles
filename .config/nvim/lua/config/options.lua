-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.colorcolumn = "80"
opt.smartcase = false

-- vim.g.root_spec = { "lsp", "cwd" }
vim.g.root_spec = { "cwd" }
vim.g.snacks_animate = false
vim.o.statuscolumn = "%s %l %r"
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.ai_cmp = true

vim.lsp.config("jdtls", {
  root_markers = { "gradlew", "mvnw" },
})
