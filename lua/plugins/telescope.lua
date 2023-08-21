return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  opts = {
    -- change some options
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      file_ignore_patterns = { ".ipynb" },
    },
  },
}
