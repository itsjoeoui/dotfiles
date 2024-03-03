return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    servers = {
      tailwindcss = {
        filetypes = { "templ" },
        init_options = {
          userLanguages = {
            templ = "html",
          },
        },
      },
      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectory = { mode = "auto" },
        },
      },
      pyright = {},
      ruff_lsp = {},
      clangd = {
        filetypes = { "c", "cpp" },
      },
      -- tsserver = {
      --   settings = {
      --     typescript = {
      --       format = {
      --         indentSize = vim.o.shiftwidth,
      --         convertTabsToSpaces = vim.o.expandtab,
      --         tabSize = vim.o.tabstop,
      --       },
      --       inlayHints = {
      --         -- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
      --         includeInlayEnumMemberValueHints = true,
      --         includeInlayFunctionLikeReturnTypeHints = true,
      --         includeInlayFunctionParameterTypeHints = true,
      --         includeInlayParameterNameHints = "all",
      --         includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
      --         includeInlayPropertyDeclarationTypeHints = true,
      --         includeInlayVariableTypeHints = true,
      --         includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
      --       },
      --     },
      --     javascript = {
      --       format = {
      --         indentSize = vim.o.shiftwidth,
      --         convertTabsToSpaces = vim.o.expandtab,
      --         tabSize = vim.o.tabstop,
      --       },
      --       inlayHints = {
      --         includeInlayEnumMemberValueHints = true,
      --         includeInlayFunctionLikeReturnTypeHints = true,
      --         includeInlayFunctionParameterTypeHints = true,
      --         includeInlayParameterNameHints = "all",
      --         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      --         includeInlayPropertyDeclarationTypeHints = true,
      --         includeInlayVariableTypeHints = true,
      --         includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      --       },
      --     },
      --     completions = {
      --       completeFunctionCalls = true,
      --     },
      --   },
      -- },
    },
  },
}
