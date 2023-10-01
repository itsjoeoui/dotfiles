return {
  "nvimtools/none-ls.nvim",
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        -- nls.builtins.formatting.stylua,
        -- nls.builtins.formatting.black,
        -- nls.builtins.formatting.ocamlformat,
        -- nls.builtins.formatting.prettierd,
        -- nls.builtins.formatting.fourmolu,
        nls.builtins.code_actions.eslint_d,
      },
    }
  end,
}
