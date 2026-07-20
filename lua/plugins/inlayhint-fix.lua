return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    config = function()
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
    end,
  },
}
