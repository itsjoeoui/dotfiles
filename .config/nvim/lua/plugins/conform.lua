return {
  "stevearc/conform.nvim",
  opts = function()
    -- Cache to avoid repeated file system searches
    local formatter_cache = {}

    local function select_js_ts_formatter(bufnr)
      local root = vim.fs.root(bufnr, { ".git", "package.json" })
      if not root then
        return { "prettierd", "prettier", stop_after_first = true }
      end

      -- Check cache first
      if formatter_cache[root] then
        return formatter_cache[root]
      end

      -- Check for oxc config
      local has_oxc = vim.fs.find({ "oxlintrc.json", ".oxlintrc.json", "oxc.json" }, {
        path = root,
        upward = false,
      })[1]

      local formatters
      if has_oxc then
        formatters = { "oxfmt" }
      else
        formatters = { "prettierd", "prettier", stop_after_first = true }
      end

      -- Cache the result
      formatter_cache[root] = formatters
      return formatters
    end

    return {
      formatters_by_ft = {
        javascript = select_js_ts_formatter,
        javascriptreact = select_js_ts_formatter,
        typescript = select_js_ts_formatter,
        typescriptreact = select_js_ts_formatter,

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

        ["*"] = { "trim_whitespace", "codespell" },
      },
    }
  end,
}
