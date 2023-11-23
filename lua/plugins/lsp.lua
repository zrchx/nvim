-- Symbols and misc config
local signs = { Error = " X", Warn = " !", Hint = " ?", Info = "I" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numthl = hl})
end

vim.diagnostic.config {
  virtual_text = {
    prefix = "[^]",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup ({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
      },
    },
  }
})
