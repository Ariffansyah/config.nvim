return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*",
  config = function()
    local width = 40
    local height = 1 -- Single line is less likely to block things

    require("screenkey").setup({
      win_opts = {
        relative = "editor",
        anchor = "SE", -- Bottom-Right is usually safer than center
        width = width,
        height = height,
        border = "rounded",
        -- Position it just above the statusline
        row = vim.o.lines - 3,
        col = vim.o.columns - 2,
      },
      show_leader = true,
      clear_after = 3,
    })

    -- Start it by default
    vim.cmd("Screenkey")

    -- AUTO-TOGGLE: This will close screenkey when you open "Trouble"
    -- and reopen it when you close "Trouble"
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "trouble",
      callback = function()
        vim.cmd("Screenkey") -- Toggles it OFF

        vim.api.nvim_create_autocmd("BufWinLeave", {
          buffer = 0,
          once = true,
          callback = function()
            vim.cmd("Screenkey") -- Toggles it back ON
          end,
        })
      end,
    })
  end,
  keys = {
    -- Manual toggle: hit <leader>sk if it's blocking your view!
    { "<leader>usk", "<cmd>Screenkey<cr>", desc = "Toggle Screenkey" },
  },
}
