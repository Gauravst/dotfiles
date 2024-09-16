vim.g.mapleader = " "
-- Disable font ligatures in Neovim
vim.o.guifont = "JetBrainsMono Nerd Font:h12"
-- vim.cmd [[
--     autocmd VimLeave * set guicursor=a:ver25
-- ]]

-- Lua configuration for Neovim

-- Function to render image in Kitty terminal
local function render_image()
  local file = vim.fn.expand "<afile>"
  if file:match "%.png$" or file:match "%.jpg$" or file:match "%.jpeg$" or file:match "%.gif$" then
    vim.fn.system("kitty +kitten icat " .. file)
  end
end

-- Function to show a custom recording message
local function show_macro_recording_start()
  vim.api.nvim_echo({ { "Recording macro in @" .. vim.fn.reg_recording(), "WarningMsg" } }, false, {})
end

-- Function to show a custom recording end message
local function show_macro_recording_stop()
  vim.api.nvim_echo({ { "Stopped recording macro", "WarningMsg" } }, false, {})
end

-- Autocommands to handle macro recording messages
vim.api.nvim_create_autocmd("RecordingEnter", {
  pattern = "*",
  callback = show_macro_recording_start,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  pattern = "*",
  callback = show_macro_recording_stop,
})

-- Autocommand to trigger the image rendering function when opening an image file
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.png,*.jpg,*.jpeg,*.gif",
  callback = render_image,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "autocmds"
require "nvconfig"
vim.schedule(function()
  require "mappings"
end)
