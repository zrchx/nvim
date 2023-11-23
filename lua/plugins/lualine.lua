require('lualine').setup {
  options = {
    component_separators = "",
    section_separators = " ",
  },
  globalstatus = true,
  inactive_sections = {},
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {function () return " ZrchX " end},
    },
    lualine_c = {
      "%=",
      { function ()
        return vim.api.nvim_win_get_number(0)
      end
      }
    },
    lualine_x = {},
    lualine_y = {
      {function () return " XchrZ " end},
      { "searchcount", timeout = 100 },
    },
    lualine_z = { "location" },
  },
  tabline = {
    lualine_a = {
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
      end, color = { gui = "bold" }
      },
    },
    lualine_b = {
      { "diagnostics", sources = { "nvim_lsp" }, colored = false,
        symbols = { error = "X ", warn = "! ", hint = "? ", info = "I " }
      },
    },
    lualine_c = {
      "%=",
      { "tabs", color = { gui = "bold" },
        mode = 2, path = nil, show_modified_status = false,
      }
    },
    lualine_x = {},
    lualine_y = {
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
    },
    lualine_z = {
      { "branch", icon = "", color = { gui = "bold" } },
    },
  },
}
