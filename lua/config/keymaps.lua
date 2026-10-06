-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "<C-H>", "<C-W>", { desc = "Delete previous word in insert mode" })
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete previous word in insert mode" })

-- Accept Copilot suggestion (Tab also works, via blink)
vim.keymap.set("i", "<C-j>", function()
  vim.lsp.inline_completion.get()
end, { desc = "Accept Copilot suggestion" })

-- Show notification history
vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<cr>", { desc = "Show notification history" })

vim.keymap.set("n", "<leader>fp", function()
  Snacks.picker.projects()
end, { desc = "Projects" })

vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "LSP code action" })

vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic details" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Show all diagnostics" })

-- GUI-style copy/paste with the system clipboard
vim.keymap.set("x", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<C-c>", '"+yy', { desc = "Copy line to system clipboard" })
vim.keymap.set("i", "<C-v>", "<C-r>+", { desc = "Paste from system clipboard" })

-- Cheatsheet of the shortcuts worth remembering (full list: <leader>sk)
vim.keymap.set("n", "<leader>k", function()
  Snacks.win({
    title = " Shortcuts ",
    border = "rounded",
    width = 60,
    height = 33,
    bo = { filetype = "markdown", modifiable = false },
    wo = { conceallevel = 2 },
    keys = { q = "close", ["<esc>"] = "close" },
    text = {
      "## Claude",
      "  <leader>Cc     toggle Claude",
      "  <leader>Cf     focus Claude",
      "  <leader>Cs     send selection (visual) / add file (neo-tree)",
      "  <leader>Cb     add current buffer",
      "  <leader>Ca/Cd  accept / deny diff",
      "",
      "## Terminal",
      "  Ctrl+/         toggle terminal",
      "  Esc Esc        terminal -> normal mode",
      "",
      "## Editing",
      "  gcc            comment line",
      "  gc (visual)    comment selection",
      "  Alt+j/k        move line / selection",
      "  gsa / gsd      add / delete surrounding",
      "  <leader>cf     format buffer",
      "",
      "## Code",
      "  gd / K         definition / hover",
      "  ga             code action",
      "  <leader>cr     rename",
      "  <leader>xx     diagnostics list",
      "",
      "## Files",
      "  <leader>e      file explorer",
      "  <leader>space  find files",
      "  <leader>/      grep",
      "  <leader>a      harpoon add   Ctrl+e  harpoon menu",
      "  <leader>1-9    harpoon jump to file",
      "  <leader>gg     lazygit",
    },
  })
end, { desc = "Shortcuts cheatsheet" })
