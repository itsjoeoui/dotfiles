return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Use a sub-list to run only the first available formatter
      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },

      templ = { "templ" },

      proto = { "buf" },

      -- Use the "*" filetype to run formatters on all filetypes. ["*"] = { "codespell" },

      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["*"] = { "trim_whitespace" },
    },
    formatters = {
      rubocop = {
        command = require("conform.util").find_executable({
          "~/.rbenv/shims/rubocop",
        }, "rubocop"),
      },
    },
  },
}
