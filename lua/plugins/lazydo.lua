return {
  {
    "Dan7h3x/LazyDo",
    branch = "main",
    cmd = { "LazyDoToggle", "LazyDoPin" },
    keys = {
      {
        "<F2>",
        function()
          require("lazydo").toggle("list")
        end,
        mode = { "n" },
        desc = "LazyDo List",
      },
      { "<leader>op", "<cmd>LazyDoPin<cr>", mode = { "n" }, desc = "LazyDo Pin" },
    },
    event = "VeryLazy",
    opts = {
      views = {
        default_view = "kanban",
        kanban = {
          enabled = true,
          columns = {
            { id = "backlog", title = "Backlog", filter = { status = "pending" } },
            { id = "in_progress", title = "In Progress", filter = { status = "in_progress" } },
            { id = "blocked", title = "Blocked", filter = { status = "blocked" } },
            { id = "done", title = "Done", filter = { status = "done" } },
          },
        },
      },
      storage = {
        project = { enabled = false, auto_detect = false, use_git_root = true },
        startup_detect = false,
        silent = true,
        global_path = vim.fn.expand("~/.config/nvim/.lazydo/tasks.json"),
        auto_backup = true,
        backup_count = 3,
        compression = true,
        readable = false,
        encryption = false,
      },
      pin_window = {
        enabled = true,
        width = 46,
        max_height = 10,
        position = "topright",
        title = " LazyDo ",
        auto_sync = true,
      },
      features = {
        statusline = { enabled = true },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      opts.sections = opts.sections or {}
      opts.sections.lualine_x = opts.sections.lualine_x or {}
      table.insert(opts.sections.lualine_x, {
        function()
          return require("lazydo").get_lualine_stats()
        end,
        cond = function()
          return require("lazydo")._initialized
        end,
      })
    end,
  },
}
