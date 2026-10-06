return {
  "monkoose/neocodeium",
  enabled = false, -- using Copilot (ai.copilot-native extra); flip to true to switch back
  event = "InsertEnter",
  opts = {},
  keys = {
    { "<C-j>", function() require("neocodeium").accept() end, mode = "i", desc = "NeoCodeium: accept" },
    { "<M-]>", function() require("neocodeium").cycle_or_complete() end, mode = "i", desc = "NeoCodeium: next" },
    { "<M-[>", function() require("neocodeium").cycle_or_complete(-1) end, mode = "i", desc = "NeoCodeium: prev" },
    { "<C-]>", function() require("neocodeium").clear() end, mode = "i", desc = "NeoCodeium: clear" },
  },
}
