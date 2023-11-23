require("ibl").setup({
  indent = { char = "|" },
  exclude = {
    filetypes = {
      "help", "terminal",
      "lazy", "lspinfo",
      "mason",
    },
    buftypes = { "terminal" },
  },
})

