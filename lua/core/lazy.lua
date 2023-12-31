-- BootStrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Init
require("lazy").setup({
  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  -- Autopairs
  { "windwp/nvim-autopairs" },
  -- CMP
  { "hrsh7th/nvim-cmp" }, { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-nvim-lsp" }, { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" }, { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter" },
  -- Indentline
  { "lukas-reineke/indent-blankline.nvim" },
  -- Lualine
  { "nvim-lualine/lualine.nvim" },
  -- Bufferline
  { "willothy/nvim-cokeline", dependencies = {"nvim-lua/plenary.nvim"} },
  -- File explorer
  { "nvim-tree/nvim-tree.lua" },
  -- Terminal
  { "akinsho/toggleterm.nvim" },
  -- Dashbord
  { "goolord/alpha-nvim" },
  -- Colorizer
  { "NvChad/nvim-colorizer.lua" },
  -- Gitsigns
  { "lewis6991/gitsigns.nvim" },
  -- Theme
  { "zrchx/abyss" },
},
-- Config
{
  defaults = { lazy = true },
  ui = {
    icons = {
      ft = "+",
      lazy = "*",
      loaded = "^",
      not_loaded = "-",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin", "tohtml",
        "getscript", "getscriptPlugin",
        "gzip", "logipat", "netrw",
        "netrwPlugin", "netrwSettings",
        "netrwFileHandlers", "matchit",
        "tar", "tarPlugin", "rrhelper",
        "spellfile_plugin", "vimball",
        "vimballPlugin", "zip",
        "zipPlugin", "tutor", "rplugin",
        "syntax", "synmenu", "optwin",
        "compiler", "bugreport",
        "ftplugin",
      },
    },
  },
})
