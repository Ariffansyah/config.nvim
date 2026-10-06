-- Enhanced yank/paste with system clipboard integration
return {
  "gbprod/yanky.nvim",
  recommended = true,
  desc = "Better Yank/Paste with Clipboard Integration",
  event = "LazyFile",
  dependencies = {
    { "kkharji/sqlite.lua", enabled = not jit.os:find("Windows") },
  },
  opts = {
    ring = {
      history_length = 100,
      storage = "shada",
      storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db",
      sync_with_numbered_registers = true,
      cancel_event = "update",
      ignore_registers = { "_" },
      update_register_on_cycle = false,
    },
    system_clipboard = {
      sync_with_ring = not vim.env.SSH_CONNECTION,
      clipboard_register = nil,
    },
    picker = {
      select = {
        action = nil,
      },
      telescope = {
        use_default_mappings = true,
        mappings = nil,
      },
    },
    highlight = {
      on_put = true,
      on_yank = true,
      timer = 150,
    },
    preserve_cursor_position = {
      enabled = true,
    },
    textobj = {
      enabled = true,
    },
  },
  keys = {
    -- Yank history picker (FIXED - uses Telescope or default)
    {
      "<leader>p",
      function()
        if LazyVim.pick.picker.name == "telescope" then
          require("telescope").extensions.yank_history.yank_history({})
        else
          -- Use yanky's built-in ring history for all other pickers
          vim.cmd([[YankyRingHistory]])
        end
      end,
      mode = { "n", "x" },
      desc = "Open Yank History",
    },

    -- Yank and put operations
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Text After Cursor" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Cursor" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put Text After Selection" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Selection" },

    -- Cycle through yank history
    { "<c-p>", "<Plug>(YankyPreviousEntry)", mode = { "n" }, desc = "Cycle Previous Yank" },
    { "<c-n>", "<Plug>(YankyNextEntry)", mode = { "n" }, desc = "Cycle Next Yank" },
    { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Through Yank History" },
    { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History" },

    -- Indented put operations
    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
    { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
    { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },

    -- Shift operations
    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and Indent Right" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and Indent Left" },
    { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before and Indent Right" },
    { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put Before and Indent Left" },

    -- Filter operations
    { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put After Applying a Filter" },
    { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put Before Applying a Filter" },

    -- Ctrl+C and Ctrl+V for system clipboard
    { "<C-c>", '"+y', mode = { "v", "x" }, desc = "Copy to System Clipboard" },
    { "<C-c>", '"+yy', mode = { "n" }, desc = "Copy Line to System Clipboard" },
    { "<C-v>", "<C-r>+", mode = { "i" }, desc = "Paste from System Clipboard (Insert)" },
  },
}
