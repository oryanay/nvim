-- Set <space> as the leader key
vim.g.mapleader = " "
-- Set <comma> as the local leader key
vim.g.maplocalleader = ","

vim.g.have_nerd_font = true

local opt = vim.opt

-- Make line numbers default
opt.number = true
opt.relativenumber = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- Tab/Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undofile = true -- Save undo history
-- opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a") -- Enable mouse mode
-- opt.clipboard:append("unnamedplus") -- Sync clipboard between OS and Neovim.
opt.modifiable = true
opt.encoding = "UTF-8"
