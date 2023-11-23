-- Aliases --
local key = vim.api.nvim_set_keymap
local dopts = { noremap = true, silent = true }

-- Remap default keys

-- Windows keys
key("n", "<S-q>", ":horizontal split ", dopts)
key("n", "<S-e>", ":vertical split ", dopts)
key("n", "<S-x>", ":close<CR>", dopts)

-- Open Terminal
key("n", "<S-t>", ":terminal<CR>", dopts)

-- Savefiles
key("n", "<S-s>", ":w<CR>", dopts)
key("n", "<S-z>", ":q<CR>", dopts)

-- NvimTree
key("n", "<S-f>", ":NvimTreeFocus<CR>", dopts)
