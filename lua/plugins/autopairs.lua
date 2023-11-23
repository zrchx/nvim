require("nvim-autopairs").setup({
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt" },
})
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
require("cmp").event:on("comfirm_done", cmp_autopairs.on_confirm_done())
