-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- lua/config/keymaps.lua
-- Delete next word in command-line mode (:)
_G.delete_next_word_cmdline = function()
  local line = vim.fn.getcmdline()
  local pos = vim.fn.getcmdpos() -- 1-based

  local before = line:sub(1, pos - 1)
  local after = line:sub(pos)

  -- Delete whitespace + next word/symbol group
  local s, e = after:find("^%s*[%w_%-]+")
  if not s then
    s, e = after:find("^%s*%S+")
  end

  if s and e then
    after = after:sub(e + 1)
  end

  local new_line = before .. after
  vim.fn.setcmdpos(#before + 1)
  return new_line
end

-- INSERT MODE
-- Ctrl+Backspace: delete word behind cursor
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-h>", "<C-w>", { noremap = true, silent = true }) -- fallback for many terminals

-- Ctrl+Del: delete word in front of cursor
vim.keymap.set("i", "<C-Del>", "<C-g>u<C-o>dw", { noremap = true, silent = true })

-- COMMAND-LINE MODE (:)
-- Ctrl+Backspace: delete word behind cursor
vim.keymap.set("c", "<C-BS>", "<C-w>", { noremap = true, silent = true })
vim.keymap.set("c", "<C-h>", "<C-w>", { noremap = true, silent = true }) -- fallback

-- Ctrl+Del: delete word in front of cursor
vim.keymap.set("c", "<C-Del>", [[<C-\>e v:lua.delete_next_word_cmdline()<CR>]], {
  noremap = true,
  silent = true,
})

-- <leader>tc: open terminal in current working directory
pcall(vim.keymap.del, "n", "<C-;>")

vim.keymap.set("n", "<leader>tc", function()
  require("here-term").open()
end, { desc = "Open terminal in cwd" })

vim.keymap.set("n", "<leader>cP", function()
  local start_pos = vim.api.nvim_buf_get_mark(0, "[")
  local end_pos = vim.api.nvim_buf_get_mark(0, "]")

  if start_pos[1] == 0 or end_pos[1] == 0 then
    return
  end

  require("conform").format({
    lsp_format = "fallback",
    async = true,
    range = {
      start = { start_pos[1], start_pos[2] },
      ["end"] = { end_pos[1], end_pos[2] },
    },
  })
end, { desc = "Format Last Change/Paste" })
