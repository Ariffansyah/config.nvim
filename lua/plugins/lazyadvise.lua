return {
  {
    dir = "~/Documents/lazyadvise",
    name = "lazyadvise",
    cond = vim.uv.fs_stat(vim.fn.expand("~/Documents/lazyadvise")) ~= nil,
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "LazyAdvise",
    keys = {
      { "<leader>ce", "<cmd>LazyAdvise<cr>", desc = "Toggle AI Advisor (9Router)" },
      { "<leader>cE", function() require("lazyadvise").detail() end, desc = "AI Advisor: add goal detail" },
      { "<leader>cM", function() require("lazyadvise").switch() end, desc = "AI Advisor: switch panel/inline" },
    },
    opts = {
      model = "lazyadvisor", -- save review; any id from `curl localhost:20128/v1/models`
      -- hint_model = "cf/@cf/meta/llama-3.1-70b-instruct-fp8-fast", -- advice while typing (default)
      -- mode = "inline", -- or "panel"
      -- api_key defaults to $NINEROUTER_API_KEY; keep the key out of your dotfiles
    },
  },
}
