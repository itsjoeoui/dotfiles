return {
  "vuki656/package-info.nvim",
  requires = "MunifTanjim/nui.nvim",
  lazy = true,
  config = function()
    require("package-info").setup()
  end,
}
