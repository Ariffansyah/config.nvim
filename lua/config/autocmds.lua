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

-- Clamp inlay hint extmarks to the line end; servers sometimes send columns
-- past EOL, which makes nvim_buf_set_extmark throw.
local patched = false
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("inlayhint-fix", { clear = true }),
  callback = function()
    if patched then
      return
    end
    local ns = vim.api.nvim_get_namespaces()["nvim.lsp.inlayhint"]
    if ns then
      patched = true
      local orig = vim.api.nvim_buf_set_extmark
      vim.api.nvim_buf_set_extmark = function(bufnr, ns_id, lnum, col, opts, ...)
        if ns_id == ns then
          local line = vim.api.nvim_buf_get_lines(bufnr, lnum, lnum + 1, false)[1]
          if line and col and col > #line then
            col = #line
          end
        end
        return orig(bufnr, ns_id, lnum, col, opts, ...)
      end
    end
  end,
})
