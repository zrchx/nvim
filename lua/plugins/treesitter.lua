require"nvim-treesitter.configs".setup{
  sync_install = false,
  auto_install = true,
  indent = { enable = false },
  highlight = { enable = true },
  ensure_installed = { "c", "lua" },
}
