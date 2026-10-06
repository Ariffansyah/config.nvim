return {
  -- Inline diagnostics
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "modern",
        options = {
          show_source = true,
          multilines = false,
          multiple_diag_under_cursor = false,
        },
      })
      vim.diagnostic.config({ virtual_text = false })
    end,
  },

  -- Code actions preview + enhanced hover (keys: lsp.lua servers["*"].keys)
  { "aznhe21/actions-preview.nvim", lazy = true },
  { "Fildo7525/pretty_hover", lazy = true, opts = {} },
}
