return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- JavaScript/TypeScript - prioritize local biome/prettier
        javascript = { "biome", "prettier", "prettierd", stop_after_first = true },
        typescript = { "biome", "prettier", "prettierd", stop_after_first = true },
        javascriptreact = { "biome", "prettier", "prettierd", stop_after_first = true },
        typescriptreact = { "biome", "prettier", "prettierd", stop_after_first = true },
        json = { "biome", "prettier", "prettierd", stop_after_first = true },
        css = { "biome", "prettier", "prettierd", stop_after_first = true },

        -- Python
        python = { "black", "isort" },

        -- Java
        java = { "google-java-format" },

        go = { "gofmt" },
        -- Other languages
        lua = { "stylua" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
      },
    },
  },
}
