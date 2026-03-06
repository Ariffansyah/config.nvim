return {
  "lervag/vimtex",
  lazy = false, -- VimTeX should not be lazy-loaded
  init = function()
    -- Set Zathura as the default PDF viewer
    vim.g.vimtex_view_method = "zathura"

    -- Use latexmk as the default compiler (continuous compilation)
    vim.g.vimtex_compiler_method = "latexmk"

    -- Hide VimTeX compilation warnings/info messages if they get annoying
    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull",
      "Overfull",
      "specifier changed to",
    }
  end,
}
