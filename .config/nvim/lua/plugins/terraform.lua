return {
  "hashicorp/terraform-ls",

  init = function()
    require("lspconfig").terraformls.setup({})
  end,
}
