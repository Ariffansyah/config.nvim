return {
  "okuuva/auto-save.nvim",
  enabled = false,
  cmd = "ASToggle",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = true,
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost" },
      defer_save = { "InsertLeave", "TextChanged" },
    },
    debounce_delay = 1000,
    condition = function(buf)
      local fn = vim.fn
      local utils = require("auto-save.utils.data")

      if fn.getbufvar(buf, "&buftype") ~= "" then
        return false
      end
      return true
    end,
    callbacks = {
      before_saving = function(buf)
        if vim.fn.exists(":ConformInfo") ~= 0 then
          require("conform").format({ bufnr = buf, lsp_format = "fallback" })
        end
      end,
    },
  },
}
