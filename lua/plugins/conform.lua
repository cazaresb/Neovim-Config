return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        java = { "google-java-format" },
        python = { "isort", "black" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },

      formatters = {
        -- Optional: customize args if you want
        black = {
          extra_args = { "--line-length", "88" },
        },
        isort = {
          extra_args = { "--profile", "black" },
        },
        ["google-java-format"] = {
          -- usually fine with defaults
        },
        ["clang-format"] = {
          -- usually best to let it read your project's .clang-format if present
        },
      },
    },
  },
}

