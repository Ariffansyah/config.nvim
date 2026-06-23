return {
  "folke/snacks.nvim",
  opts = {
    scroll = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { icon = " ", title = "Recent Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
      preset = {
        header = [[
  ██╗   ██████╗       ███╗   ██╗  █████╗  ██╗ ██╗       █████╗ 
 ██╔╝   ╚════██╗      ████╗  ██║ ██╔══██╗ ██║ ██║      ██╔══██╗
██╔╝     █████╔╝      ██╔██╗ ██║ ███████║ ██║ ██║      ███████║
██╚╗     ╚═══██╗      ██║╚██╗██║ ██╔══██║ ██║ ██║      ██╔══██║
 ██╚╗   ██████╔╝      ██║ ╚████║ ██║  ██║ ██║ ███████╗ ██║  ██║
  ╚═╝   ╚═════╝       ╚═╝  ╚═══╝ ╚═╝  ╚═╝ ╚═╝ ╚══════╝ ╚═╝  ╚═╝
  ]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
