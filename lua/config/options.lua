-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Only overrides of those defaults live here. Diagnostics config: lua/plugins/lsp.lua

vim.g.maplocalleader = " "
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes:2"
vim.opt.softtabstop = 2
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 100
vim.opt.ttimeoutlen = 10
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "python" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})
