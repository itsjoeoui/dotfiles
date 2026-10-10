-- Keep language extras and transitive dependencies from re-enabling unused features.
return {
  { "mfussenegger/nvim-dap", enabled = false },
  { "nvim-neotest/neotest", enabled = false },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(name)
        return not vim.tbl_contains(
          { "codelldb", "delve", "debugpy", "js-debug-adapter", "java-debug-adapter", "java-test", "black", "texlab" },
          name
        )
      end, opts.ensure_installed or {})
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    optional = true,
    opts = {
      dap = { adapter = false, autoload_configurations = false },
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cR", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "Code Action", buffer = bufnr })
        end,
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
      if vim.fn.executable("rust-analyzer") == 0 then
        LazyVim.error("rust-analyzer not found in PATH", { title = "rustaceanvim" })
      end
    end,
  },
}
