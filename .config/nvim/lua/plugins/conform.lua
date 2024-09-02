return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Use a sub-list to run only the first available formatter
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      json = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },

      templ = { "templ" },

      proto = { "buf" },

      -- Use the "*" filetype to run formatters on all filetypes. ["*"] = { "codespell" },

      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["_"] = { "trim_whitespace" },
    },
  },
}
