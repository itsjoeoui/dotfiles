return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Relay is project-local and has no Mason package.
      relay_lsp = { mason = false },
      tsgo = { enabled = false }, -- Avoid a second TypeScript server beside vtsls.
      jsonls = { filetypes = { "json", "jsonc", "ejson" } },
    },
  },
}
