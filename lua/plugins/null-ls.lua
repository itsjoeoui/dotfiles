return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.rustfmt,
        nls.builtins.formatting.black,
        nls.builtins.formatting.ocamlformat,
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.fourmolu,
        require("typescript.extensions.null-ls.code-actions"),
      },
    }
  end,
}
