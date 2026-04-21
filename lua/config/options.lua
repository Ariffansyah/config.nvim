-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ========================================
-- EDITOR SETTINGS
-- ========================================
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes:2"

-- ========================================
-- INDENTATION & TABS
-- ========================================
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- ========================================
-- SEARCH & REPLACE
-- ========================================
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- ========================================
-- DISPLAY & UI
-- ========================================
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.textwidth = 0
vim.opt.colorcolumn = ""
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- ========================================
-- PERFORMANCE
-- ========================================
vim.opt.updatetime = 100
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10

-- ========================================
-- FILE HANDLING
-- ========================================
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.swapfile = false

-- ========================================
-- WINDOW & SPLIT BEHAVIOR
-- ========================================
vim.opt.splitbelow = true
vim.opt.splitright = true

-- ========================================
-- COMPLETION
-- ========================================
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 10

-- ========================================
-- MISC
-- ========================================
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.inccommand = "nosplit"
vim.opt.joinspaces = false

-- ========================================
-- DIAGNOSTIC CONFIGURATION - C++ ERRORS
-- ========================================

-- Main diagnostic config
vim.diagnostic.config({
  virtual_text = true, -- Show inline errors
  virtual_lines = false, -- Disable lsp_lines virtual lines
  signs = true, -- Show error signs in gutter
  underline = true, -- Underline errors
  update_in_insert = true, -- Show errors while typing
  severity_sort = true, -- Sort by severity
  float = {
    border = "rounded",
    source = "always", -- Show source (clangd, eslint, etc)
    max_width = 100,
    max_height = 20,
    header = "",
    prefix = "",
    format = function(diagnostic)
      local message = diagnostic.message
      local source = diagnostic.source or "LSP"
      local code = diagnostic.code or ""

      if code ~= "" then
        return string.format("[%s:%s] %s", source, code, message)
      else
        return string.format("[%s] %s", source, message)
      end
    end,
  },
})

-- Configure diagnostic signs with icons
local signs = {
  Error = "󰅙",
  Warn = "⚠",
  Hint = "💡",
  Info = "ℹ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- ========================================
-- DIAGNOSTIC KEYMAPS
-- ========================================

-- Show full error message in floating window
vim.keymap.set("n", "<leader>e", function()
  vim.diagnostic.open_float(nil, {
    border = "rounded",
    source = "always",
  })
end, { desc = "Show error details" })

-- Show detailed error at cursor
vim.keymap.set("n", "<leader>de", function()
  vim.diagnostic.open_float(nil, {
    scope = "cursor",
    border = "rounded",
    source = "always",
    prefix = " ",
  })
end, { desc = "Show diagnostic details" })

-- Jump to previous error
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous error" })

-- Jump to next error
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next error" })

-- Show all diagnostics in location list
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Show all diagnostics" })

-- Toggle virtual text
vim.keymap.set("n", "<leader>dv", function()
  local config = vim.diagnostic.config()
  vim.diagnostic.config({ virtual_text = not config.virtual_text })
end, { desc = "Toggle virtual text" })

-- ========================================
-- LSP ZERO INTEGRATION (if using lsp-zero)
-- ========================================

-- Ensure LSP attaches to C++ files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "cc", "cxx", "h", "hpp", "hxx" },
  callback = function() end,
})

-- ========================================
-- LANGUAGE-SPECIFIC SETTINGS
-- ========================================

-- C/C++ specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Lua specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Python specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.g.autoformat = true
