return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "float",
      popup = {
        size = {
          height = "80%",
          width = "80%",
        },
        position = "50%",
      },
    },
    default_component_configs = {
      file_size = {
        enabled = true,
        required_width = 1,
        width = 12,
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        use_filtered_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "󰁕",
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
          unmerged = "",
        },
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = true,
        hide_gitignored = true,
      },
      renderers = {
        file = {
          { "icon" },
          { "name", use_git_status_colors = true, use_filtered_colors = true },
          { "git_status" },
          { "file_size" },
        },
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
      {
        event = "state_created",
        handler = function(state)
          if state.name ~= "filesystem" then
            return
          end
          local git_status = state.components.git_status
          state.components.git_status = function(config, node, s)
            if node.filtered_by then
              return {}
            end
            return git_status(config, node, s)
          end
        end,
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.api.nvim_set_hl(0, "NeoTreeDotfile", { link = "Comment" })
  end,
}
