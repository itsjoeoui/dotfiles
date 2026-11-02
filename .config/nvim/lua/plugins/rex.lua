return {
  "paul-enz/vim-rex-navigator",
  lazy = false,
  init = function()
    if not vim.env.REX_BIN_PATH and vim.fn.executable("rex") == 0 then
      local rex = "/Applications/Rex Beta.app/Contents/Helpers/Rex Server.rex/Contents/MacOS/rex"
      if vim.fn.executable(rex) == 1 then
        vim.env.REX_BIN_PATH = rex
      end
    end
  end,
}
