-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave", "CursorHold", "CursorHoldI" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = "*",
})

-- Reliable LSP enablement.
-- On this setup LazyVim's nvim-lspconfig config loads but never reaches the
-- step that calls `vim.lsp.enable()`, so no server ever attaches (empty
-- "Enabled Configurations" in :checkhealth vim.lsp). This enables every
-- configured+enabled server ourselves, independent of that loop.
--
-- This file is itself loaded by LazyVim on the VeryLazy event, so plugins are
-- already loaded here. We run on the next scheduler tick (so the current event
-- finishes and any freshly-opened buffer exists) rather than waiting for a
-- VeryLazy autocmd, which would register too late to ever fire.
vim.schedule(function()
  local ok, servers = pcall(function()
    return require("lazyvim.util").opts("nvim-lspconfig").servers or {}
  end)
  if not ok then
    return
  end
  for name, cfg in pairs(servers) do
    if name ~= "*" and cfg ~= false then
      local sopts = cfg == true and {} or cfg
      if type(sopts) ~= "table" or sopts.enabled ~= false then
        pcall(vim.lsp.config, name, sopts)
        pcall(vim.lsp.enable, name)
      end
    end
  end
end)
