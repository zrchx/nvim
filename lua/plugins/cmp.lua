local cmp = require"cmp"
cmp.setup({
  window = {
    completion = { border = "single", scrollbar = false},
    documentation = { border = "single", winhighlight = "Normal:CmpDoc" },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
	      nvim_lsp = "[LSP]",
	      luasnip = "[LuaSnip]",
	      buffer = "[Buffer]",
	      path = "[Path]",
        })
      [entry.source.name]
      return vim_item
    end
  },
  mapping = ({
    ["<C-t>"] = cmp.mapping.scroll_docs(4),
    ["<C-g>"] = cmp.mapping.scroll_docs(-4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Repace, select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources{
    { name = "nvim_lsp", priority = 1000 },
    { name = "luasnip", priority = 750 },
    { name = "buffer", priority = 500 },
    { name = "path", priority = 250 },
  }
})

require("luasnip").config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI"
})
-- VS Format
require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.luasnippets_path or "" }
require("luasnip.loaders.from_vscode").lazy_load()
-- Insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})

local caps = require("cmp_nvim_lsp").default_capabilities ()
require("lspconfig")["lua_ls"].setup {
  capabilities = caps,
}
require("lspconfig")["clangd"].setup {
  capabilities = caps,
}
require("lspconfig")["marksman"].setup {
  capabilities = caps,
}
require("lspconfig")["html"].setup {
  capabilities = caps,
}
require("lspconfig")["cssls"].setup {
  capabilities = caps,
}

