return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Use a sub-list to run only the first available formatter
      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },

      json = { "jq" },
      ejson = { "jq" },

      markdown = { "prettierd", "prettier", stop_after_first = true },

      go = {},
      templ = { "templ" },

      rust = { "rustfmt" },

      proto = { "buf" },
      c = { "clang_format" },
      cpp = { "clang_format" },

      java = { "google-java-format" },
      ocaml = { "ocamlformat" },

      -- Use the "*" filetype to run formatters on all filetypes. ["*"] = { "codespell" },

      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["*"] = { "trim_whitespace", "codespell" },
    },
    -- formatters = {
    --   rubocop = {
    --     command = require("conform.util").find_executable({
    --       "~/.rbenv/shims/rubocop",
    --     }, "rubocop"),
    --   },
    -- },
  },
}
