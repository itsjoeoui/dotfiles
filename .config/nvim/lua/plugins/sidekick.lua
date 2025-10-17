return {
  "folke/sidekick.nvim",
  opts = {
    -- add any options here
    cli = {
      mux = {
        backend = "tmux",
        enabled = true,
      },
      tools = {
        shopify = {
          cmd = { "/opt/dev/bin/dev", "tools", "run", "claude" },
          url = "https://shopify.com",
          keys = {},
        },
      },
    },
  },
}
