return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",

  opts = {
    detection_methods = { "lsp", "pattern" },

    patterns = {
      ".git",
      "Makefile",
      "package.json",
      "pyproject.toml",
      "Cargo.toml",
      "go.mod",
      "CMakeLists.txt",
    },

    silent_chdir = true,
  },

  config = function(_, opts)
    require("project_nvim").setup(opts)
    require("telescope").load_extension("projects")
  end,
}
