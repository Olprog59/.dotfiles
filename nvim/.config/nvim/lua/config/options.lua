-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

vim.g.mapleader = " "

vim.o.modifiable = true

-- Appearance
opt.termguicolors = true
-- opt.background = "dark"
opt.signcolumn = "yes"
vim.diagnostic.config({
  float = { border = "rounded" }, -- add border to diagnostic popups
  virtual_text = false,
})

-- Session Management
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 2

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

-- opt.number = true
--
-- opt.title = true
-- opt.autoindent = true
-- opt.smartindent = true
-- opt.hlsearch = true
-- opt.backup = false
-- opt.showcmd = true
-- opt.cmdheight = 0
-- opt.laststatus = 0
-- opt.expandtab = true
-- opt.scrolloff = 10
-- opt.inccommand = "split"
-- opt.ignorecase = true
-- opt.smarttab = true
-- opt.breakindent = true
-- opt.shiftwidth = 2
-- opt.tabstop = 2
-- opt.wrap = false
-- opt.backspace = { "start", "eol", "indent" }
-- opt.path:append({ "**" })
-- opt.wildignore:append({ "*/node_modules/*" })
-- opt.splitbelow = true
-- opt.splitright = true
-- opt.splitkeep = "cursor"
--
-- -- Add asterisks in block comments
-- opt.formatoptions:append({ "r" })

opt.updatetime = 50
opt.conceallevel = 2

vim.g.lazyvim_php_lsp = "intelephense"
