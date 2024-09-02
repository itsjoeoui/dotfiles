return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = true,
    },
    servers = {
      tailwindcss = {
        filetypes = { "templ" },
        init_options = {
          userLanguages = {
            templ = "html",
          },
        },
      },
    },
  },
}
