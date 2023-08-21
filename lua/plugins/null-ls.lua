return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.black,
        nls.builtins.formatting.ocamlformat,
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.fourmolu,
        nls.builtins.code_actions.eslint_d,
        require("typescript.extensions.null-ls.code-actions"),
      },
    }
  end,
}
