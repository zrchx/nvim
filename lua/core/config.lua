local o = vim.opt
-- Config
o.undofile = true
o.showmode = false
o.updatetime = 100
o.laststatus = 3
o.signcolumn = "yes"
o.linebreak = true
o.cmdheight = 0
-- Numbers
o.number = true
o.cursorline = true
-- Search
o.ignorecase = true
o.smartcase = true
-- Mouse
o.mouse = "a"
o.mousefocus = true
o.mousemoveevent = true
-- Shorter messages
o.shortmess:append("c")
-- Indent
o.expandtab = true
o.smartindent = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
-- Split
o.splitright = true
o.splitbelow = true
-- Clipboard
o.clipboard = "unnamedplus"
-- Fillchars
o.fillchars = {
  vert = "|",
  vertleft = "|",
  vertright = "|",
  verthoriz = "+",
  horiz = "-",
  horizup = "-",
  horizdown = "-",
  fold = "-",
  eob = " ",
  diff = "-",
  msgsep = "-",
  foldopen = "+",
  foldsep = "-",
  foldclose = ">"
}
-- Listchars
o.list = true
o.listchars = {
	space = " ",
	tab = "| ",
}
-- Colors
o.termguicolors = true
vim.cmd.colorscheme('nymph')
-- Disable some things
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
    vim.g["loaded_" .. provider .. "_prokvider"] = 0
end
-- LSP path to binaries
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath "data" .. "/mason/bin"
