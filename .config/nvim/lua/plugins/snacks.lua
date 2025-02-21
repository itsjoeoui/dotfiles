return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    notifier = { enabled = true, top_down = false },
    picker = {
      sources = {
        explorer = {
          layout = {
            layout = {
              position = "right",
            },
          },
        },
      },
    },
  },
}
