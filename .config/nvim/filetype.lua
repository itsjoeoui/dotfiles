vim.filetype.add({
  extension = {
    mdx = "markdown.mdx",
    ejson = "ejson",
  },
})

vim.treesitter.language.register("markdown", "markdown.mdx")
vim.treesitter.language.register("json", "ejson")
