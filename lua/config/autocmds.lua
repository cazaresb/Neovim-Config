-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local dev_formatting = vim.api.nvim_create_augroup("dev_formatting", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = dev_formatting,
  pattern = { "c", "cpp", "objc", "objcpp", "java" },
  callback = function()
    local opt = vim.opt_local
    opt.expandtab = true
    opt.shiftwidth = 4
    opt.tabstop = 4
    opt.softtabstop = 4
    opt.autoindent = true
    opt.smartindent = true
    opt.cindent = true
  end,
})
