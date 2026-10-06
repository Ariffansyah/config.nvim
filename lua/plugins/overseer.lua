return {
  {
    "stevearc/overseer.nvim",
    opts = {},
    keys = {
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run Task (pnpm dev, etc.)" },
      { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle Task Output Panel" },
      { "<leader>oa", "<cmd>OverseerClose<cr>", desc = "Close Task Panel" },
      {
        "<leader>os",
        function()
          local overseer = require("overseer")
          local tasks = overseer.list_tasks({ status = overseer.STATUS.RUNNING })
          local task = tasks[1] -- newest first
          if not task then
            return vim.notify("No running task to stop", vim.log.levels.WARN)
          end
          task:stop()
          vim.notify("Stopped: " .. task.name, vim.log.levels.INFO)
        end,
        desc = "Stop Running Task",
      },
      { "<leader>oA", "<cmd>OverseerTaskAction<cr>", desc = "Task Actions Menu (Restart/Dispose...)" },
    },
  },
}
