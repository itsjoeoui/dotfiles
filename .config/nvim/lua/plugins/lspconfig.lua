local get_root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern(".git")(fname) or util.root_pattern("package.json", "tsconfig.json")(fname)
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = true,
    },
    servers = {
      html = {
        filetypes = { "html", "eruby" },
      },
      tailwindcss = {
        filetypes = { "templ" },
        init_options = {
          userLanguages = {
            templ = "html",
          },
        },
      },
      eslint = {
        root_dir = get_root_dir,
      },
      tsserver = {
        root_dir = get_root_dir,
      },
      ruby_lsp = {
        mason = false,
        cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
      },
      rubocop = {
        mason = false,
        cmd = { vim.fn.expand("~/.rbenv/shims/rubocop"), "--lsp" },
      },
      clangd = {
        -- NOTE: need this to exclude .proto
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
      },
    },
  },
}
