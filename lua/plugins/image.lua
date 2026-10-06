return {
  -- Image rendering in Neovim
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    dependencies = {
      "kiyoon/magick.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = true, -- Only show image at cursor position
          filetypes = { "markdown", "vimwiki" },
        },
        neorg = {
          enabled = false, -- Disable if not using neorg
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "norg" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = 80, -- Limit to 80% of window width
      max_height_window_percentage = 60, -- Limit to 60% of window height
      window_overlap_clear_enabled = true, -- Enable clearing on overlap
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "neo-tree", "NvimTree", "" },
      editor_only_render_when_focused = true, -- Only render in focused window
      tmux_show_only_in_active_window = true, -- If using tmux
      kitty_method = "normal",
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" },
    },
    config = function(_, opts)
      require("image").setup(opts)

      -- Add autocommand to clear images when leaving buffer
      vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
        callback = function()
          local img = require("image")
          if img then
            img.clear()
          end
        end,
      })

      -- Clear images when entering a new window
      vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
        pattern = "*.md",
        callback = function()
          vim.defer_fn(function()
            local img = require("image")
            if img then
              img.clear()
            end
          end, 100)
        end,
      })
    end,
  },

  -- Image paste support
  {
    "HakonHarnes/img-clip.nvim",
    ft = "markdown",
    cmd = "PasteImage",
    opts = {
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = true,
        drag_and_drop = {
          insert_mode = true,
        },
      },
      filetypes = {
        markdown = {
          url_encode_path = true,
          template = "! [$CURSOR]($FILE_PATH)",
          drag_and_drop = {
            download_images = false,
          },
        },
      },
    },
    keys = {
      {
        "<leader>ip",
        "<cmd>PasteImage<cr>",
        desc = "Paste Image from Clipboard",
      },
    },
  },
}
