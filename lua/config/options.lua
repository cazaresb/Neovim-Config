-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
if vim.g.neovide then
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_no_idle = true
  vim.g.neovide_fullscreen = false
end

-- Enable filetype-based indentation
vim.cmd("filetype plugin indent on")

vim.opt.hidden = false
