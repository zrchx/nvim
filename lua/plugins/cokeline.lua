local get_hex = require("cokeline.hlgroups").get_hl_attr
require("cokeline").setup({
  default_hl = {
    fg = function(buffer)
      return buffer.is_focused and get_hex("Normal", "fg")
        or get_hex("Comment", "fg")
    end,
    bg = "NONE"
  },

  sidebar = {
    filetype = { "NvimTree" },
    components = {
      {
        text = function()
          return "       " .. "[FILE EXPLORER]" .. "       "
        end,
        bg = function() return get_hex("NvimTreeNormal", "bg") end,
        bold = true,
      },
    }
  },

  components = {
    {
      text = function(buffer) return (buffer.index ~= 1) and "| " or "" end,
      fg = function() return get_hex("Normal", "fg") end
    },
    {
      text = function(buffer) return "  " .. buffer.filename .. "  " end,
      bold = function(buffer) return buffer.is_focused end
    },
    {
      text = "  ",
    },
  },
})
