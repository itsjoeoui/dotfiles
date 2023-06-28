return {
  "nvim-telescope/telescope.nvim",
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
