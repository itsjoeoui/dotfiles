return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  config = function()
    require("silicon").setup({
      font = "CaskaydiaCove Nerd Font=26",
      theme = "Monokai Extended",
      background = "#ABB8C3",
      to_clipboard = true,
      output = "~/Desktop",
      window_title = function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
      end,
    })
  end,
}
