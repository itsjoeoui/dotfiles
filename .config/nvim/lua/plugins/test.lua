return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "fredrikaverpil/neotest-golang",
      "olimorris/neotest-rspec",
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        "neotest-golang",
        "neotest-rspec",
        "neotest-jest",
        "neotest-vitest",
      },
    },
  },
}
