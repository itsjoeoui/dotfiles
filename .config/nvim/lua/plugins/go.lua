return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    lsp_cfg = false, -- LazyVim owns gopls configuration.
    lsp_keymaps = false,
    -- other options
    goimports = "gopls", -- goimports command, can be gopls[default] or either goimports or golines if need to split long lines
    gofmt = "gopls", -- gofmt through gopls: alternative is gofumpt, goimports, golines, gofmt, etc
    max_line_len = 120,
  },
  config = function(_, opts)
    require("go").setup(opts)
  end,
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
