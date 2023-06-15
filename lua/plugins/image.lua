return {
  "samodostal/image.nvim",
  config = function()
    require("image").setup({
      render = {
        min_padding = 5,
        show_label = true,
        show_image_dimensions = true,
        use_dither = true,
        foreground_color = false,
        background_color = false,
      },
      events = {
        update_on_nvim_resize = true,
      },
    })
  end,
}
