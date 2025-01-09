local hostname = vim.fn.hostname()

if hostname == "Joeys-Shopify-MacBook-Pro.local" then
  return {}
else
  return {
    "wakatime/vim-wakatime",
  }
end
