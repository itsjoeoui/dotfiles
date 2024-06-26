return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      sql = {
        args = { "fix", "--force", "--dialect=postgres", "-" },
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      clojure = { "cljstyle" },

      -- Conform will run multiple formatters sequentially
      python = { "ruff_format", "ruff_fix" },

      -- Use a sub-list to run only the first available formatter
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      vue = { { "prettierd", "prettier" } },

      html = { { "prettierd", "prettier" } },

      astro = { { "prettier" } },

      go = { "goimports", "gofumpt" },
      templ = { "templ" },
      rust = { "rustfmt" },

      json = { "prettierd", "prettier" },
      toml = { "taplo" },

      markdown = { "prettierd", "prettier" },

      java = { "google-java-format" },

      sql = { "prettierd" },

      terraform = { "terraform_fmt" },

      proto = { "buf" },

      gleam = { "gleam" },
      elixir = { "mix" },
      ruby = { "rubocop" },
      -- Use the "*" filetype to run formatters on all filetypes. ["*"] = { "codespell" },

      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["_"] = { "trim_whitespace" },
    },
  },
}
