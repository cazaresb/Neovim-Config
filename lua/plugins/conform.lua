return {
  {
    "stevearc/conform.nvim",
    opts = {
      default_format_opts = {
        timeout_ms = 5000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        java = { "google-java-format" },
        python = { "isort", "black" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        objc = { "clang-format" },
        objcpp = { "clang-format" },
      },
      formatters = {
        black = {
          extra_args = { "--line-length", "88" },
        },
        isort = {
          extra_args = { "--profile", "black" },
        },
        ["google-java-format"] = {},
        ["clang-format"] = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "clangd",
        "clang-format",
        "google-java-format",
      })
    end,
  },
}

