vim.filetype.add({
  extension = {
    mdx = "mdx",
    ejson = "ejson",
  },
})

vim.treesitter.language.register("markdown", "mdx")
vim.treesitter.language.register("json", "ejson")
