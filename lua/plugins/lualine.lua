require('lualine').setup {
  options = {
    component_separators = "",
    section_separators = " ",
  },
  globalstatus = true,
  inactive_sections = {},
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      { "mode" },
      { "filename",
        fmt = function ()
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
          if filename == "NvimTree_1" then return "" end
          return filename
        end,
      },
      "%=",
      { function()
        local msg = ''
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return "[" .. client.name .. "]"
          end
        end
        return msg
      end
      },
      { "diagnostics", sources = { "nvim_lsp" }, colored = false,
        symbols = { error = "X ", warn = "! ", hint = "? ", info = "I " }
      },
    },
    lualine_x = {
      { "branch", icon = "" },
      { "diff", colored = false,
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed
            }
          end
        end
      },
      { "searchcount" },
      { "location" },
    },
    lualine_y = {},
    lualine_z = {},
  },
}
