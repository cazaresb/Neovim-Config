-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
if vim.g.neovide then
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_no_idle = true
  vim.g.neovide_fullscreen = false
end

vim.opt.hidden = false
-- Tabs & indentation
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 4 -- indent size when using >>
vim.opt.tabstop = 4 -- how many spaces a tab counts for
vim.opt.softtabstop = 4 -- spaces inserted when pressing Tab
vim.opt.smartindent = true -- smart auto-indenting
vim.opt.autoindent = true -- copy indent from current line
vim.opt.cindent = true -- better for C, C++, Java
