return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, {
      function()
        return require("lazydo").get_lualine_stats() -- status
      end,
      cond = function()
        return require("lazydo")._initialized -- condition for lualine
      end,
    })
  end,
}
