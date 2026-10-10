return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    local function select_js_ts_formatter(bufnr)
      -- Formatter configs can change during a session; resolve them on each format.
      -- Oxc lint configuration does not imply that the project uses Oxfmt.
      local config = vim.fs.find({ ".oxfmtrc.json", ".oxfmtrc.jsonc", "oxfmt.config.ts" }, {
        path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
        upward = true,
      })[1]
      local conform = require("conform")
      if config and conform.get_formatter_info("oxfmt", bufnr).available then
        return { "oxfmt" }
      end
      if conform.get_formatter_info("prettierd", bufnr).available then
        return { "prettierd" }
      end
      return { "prettier" }
    end

    opts.formatters = opts.formatters or {}
    for _, name in ipairs({ "trim_whitespace", "codespell" }) do
      opts.formatters[name] = vim.tbl_extend("force", opts.formatters[name] or {}, {
        condition = function(_, ctx)
          return vim.bo[ctx.buf].modifiable and vim.bo[ctx.buf].buftype == ""
        end,
      })
    end

    opts.formatters_by_ft = vim.tbl_extend("force", opts.formatters_by_ft or {}, {
      javascript = select_js_ts_formatter,
      javascriptreact = select_js_ts_formatter,
      typescript = select_js_ts_formatter,
      typescriptreact = select_js_ts_formatter,
      json = { "jq" },
      ejson = { "jq" },
      markdown = select_js_ts_formatter,
      go = { "goimports", "gofumpt" },
      templ = { "templ" },
      rust = { "rustfmt" },
      proto = { "buf" },
      cmake = { "cmake_format" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      lua = { "stylua" },
      java = { "google-java-format" },
      ocaml = { "ocamlformat" },
      sql = { "sql_formatter" },
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      ["*"] = { "trim_whitespace", "codespell" },
    })
  end,
}
