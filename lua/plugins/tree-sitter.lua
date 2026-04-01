return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Core languages
        "c",
        "cpp",
        "java",
        "python",

        -- Neovim ecosystem
        "lua",
        "vim",
        "vimdoc",

        -- Useful extras
        "bash",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",

        -- Build systems / configs
        "cmake",
        "make",
        "dockerfile",
        "gitignore",
      },

      highlight = { enable = true },
      indent = { enable = false },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          node_decremental = "<bs>",
        },
      },
    },
  },
}
