-- Relay no longer ships a native configuration in nvim-lspconfig.
local function compiler(root)
  local modules = vim.fs.find("node_modules", { path = root, upward = true, type = "directory" })[1]
  local local_bin = modules and (modules .. "/.bin/relay-compiler")
  if local_bin and vim.fn.executable(local_bin) == 1 then
    return local_bin
  end
  return vim.fn.exepath("relay-compiler")
end

return {
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start({ compiler(config.root_dir), "lsp" }, dispatchers, { cwd = config.root_dir })
  end,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  workspace_required = true,
  root_dir = function(bufnr, on_dir)
    local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
    while dir do
      local has_config = vim.fn.glob(dir .. "/relay.config.*") ~= ""
      local package = dir .. "/package.json"
      if not has_config and vim.fn.filereadable(package) == 1 then
        local ok, value = pcall(vim.json.decode, table.concat(vim.fn.readfile(package), "\n"))
        has_config = ok and type(value) == "table" and value.relay ~= nil
      end
      if has_config then
        if compiler(dir) ~= "" then
          on_dir(dir)
        end
        return
      end
      local parent = vim.fs.dirname(dir)
      if parent == dir then
        return
      end
      dir = parent
    end
  end,
}
