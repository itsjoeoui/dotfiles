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
        shopify_claude = {
          cmd = { "/opt/dev/bin/dev", "tools", "run", "claude" },
          url = "https://shopify.com",
          keys = {},
        },
        shopify_codex = {
          cmd = { "/opt/dev/bin/dev", "tools", "run", "codex" },
          url = "https://shopify.com",
          keys = {},
        },
      },
    },
  },
}
