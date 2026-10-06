return {
  -- Harpoon (see above)

  -- Silicon screenshots
  {
    "michaelrommel/nvim-silicon",
    cmd = "Silicon",
    keys = {
      { "<leader>sc", mode = "v", desc = "Silicon: Copy to clipboard" },
      { "<leader>sf", mode = "v", desc = "Silicon: Save to file" },
      { "<leader>ss", mode = "v", desc = "Silicon: Screenshot" },
    },
    config = function()
      require("nvim-silicon").setup({
        font = "JetBrainsMono Nerd Font",
        theme = "Dracula",
        pad_horiz = 100,
        pad_vert = 120,
        no_line_number = true,
      })
    end,
  },

  -- Highlight Undo
  {
    "tzachar/highlight-undo.nvim",
    event = "VeryLazy",
    opts = {
      duration = 300,
      ignored_filetypes = { "neo-tree", "TelescopePrompt", "mason", "lazy" },
    },
  },

  -- Aerial (Code Outline)
  {
    "stevearc/aerial.nvim",
    event = "LspAttach",
    opts = {
      layout = {
        default_direction = "right",
        placement = "edge",
      },
    },
    keys = {
      { "<leader>E", "<cmd>AerialToggle float<CR>", desc = "Toggle Aerial Explorer" },
    },
  },

  -- Noice (Better UI)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = { enabled = false },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        -- Add this to show more detailed messages
        message = {
          enabled = true,
          view = "notify",
          opts = {},
        },
        progress = {
          enabled = true,
          view = "mini",
        },
      },
      presets = {
        long_message_to_split = true,
        lsp_doc_border = true, -- Add border to LSP docs
      },
      -- Show error messages with more detail
      routes = {
        {
          filter = { event = "msg_show", kind = "error" },
          opts = { skip = false },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  -- Discord Presence
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
  },

  -- Tmux Navigator
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
    },
  },
}
