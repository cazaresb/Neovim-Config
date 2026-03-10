return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")

      mc.setup()

      local set = vim.keymap.set

      -- Add or skip cursors by matching the next occurrence
      set({ "n", "x" }, "<C-d>", function()
        mc.matchAddCursor(1)
      end)
      set({ "n", "x" }, "<A-d>", function()
        mc.matchSkipCursor(1)
      end)

      -- Add cursors above / below
      set({ "n", "x" }, "<A-Up>", function()
        mc.lineAddCursor(-1)
      end)
      set({ "n", "x" }, "<A-Down>", function()
        mc.lineAddCursor(1)
      end)

      -- Rotate through cursors
      set({ "n", "x" }, "<leader>mn", mc.nextCursor)
      set({ "n", "x" }, "<leader>mp", mc.prevCursor)

      -- Delete current cursor
      set({ "n", "x" }, "<leader>mx", mc.deleteCursor)

      -- Add a cursor to every search result
      set("n", "<leader>ma", mc.searchAllAddCursors)
    end,
  },
}
