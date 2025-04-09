vim.filetype.add({
  extension = {
    mdx = "mdx",
    ejson = "ejson",
    excalidraw = "excalidraw",
  },
})

vim.treesitter.language.register("markdown", "mdx")
vim.treesitter.language.register("json", "ejson")
vim.treesitter.language.register("json", "excalidraw")
