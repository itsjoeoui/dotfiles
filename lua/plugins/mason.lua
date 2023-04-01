return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "black",
      "pyright",
      "gopls",
      "rust-analyzer",
      "ocamlformat",
      "ocaml-lsp",
      "prettierd",
    },
  },
}
