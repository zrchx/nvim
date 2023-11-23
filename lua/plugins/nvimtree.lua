local wratio = 0.4
local hratio = 0.4
require("nvim-tree").setup({
  hijack_cursor = true,
  filters = { custom = { "^.git$" } },
  renderer = {
    full_name = true,
    root_folder_label = false,
    highlight_git = true,
    icons = {
      glyphs = {
        default = "",
        symlink = "->",
        bookmark = "",
        modified = "x",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = " ->",
          symlink_open = " ->",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          untracked = "!",
          unstaged = "~",
          staged = "+",
          unmerged = "%",
          renamed = "*!",
          deleted = "-",
          ignored = "#",
        },
      },
    },
  },
  view = {
    centralize_selection = true,
    float = {
      enable = true,
      open_win_config = function()

        local window_w = vim.opt.columns:get() * wratio
        local window_h = (vim.opt.lines:get() -
                         vim.opt.cmdheight:get()) * hratio

        local center_x = (vim.opt.columns:get() - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = 'single',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = math.floor(window_w),
          height = math.floor(window_h),
        }
      end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * wratio)
    end,
  }
})
