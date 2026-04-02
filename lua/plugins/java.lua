return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      local jdtls_cmd = "C:/Users/cazar/AppData/Local/nvim-data/mason/bin/jdtls.CMD"

      opts.cmd = { jdtls_cmd }

      if LazyVim.has("mason.nvim") then
        local lombok_jar = vim.fn.expand("$MASON/share/jdtls/lombok.jar")
        table.insert(opts.cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
      end

      return opts
    end,
  },
}
