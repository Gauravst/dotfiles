require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- globals -----------------------------------------
g.toggle_theme_icon = "   "

-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

-- vim.opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
-- vim.opt.mouse = "a"
o.cmdheight = 0
vim.opt.showmode = false
-- vim.opt.clipboard = "unnamedplus"
-- vim.opt.breakindent = true
-- vim.opt.undofile = true
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true
-- vim.opt.signcolumn = "yes"
opt.updatetime = 250
-- vim.opt.timeoutlen = 300
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
