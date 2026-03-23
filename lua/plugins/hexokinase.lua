return {
  "RRethy/vim-hexokinase",
  -- This runs 'make hexokinase' automatically after install or update
  build = "make hexokinase",
  config = function()
    -- Your configuration here, for example:
    vim.g.Hexokinase_highlighters = { "virtual" }
  end,
}
