-- Base setup + <leader>1-9 jumps come from the editor.harpoon2 extra
return {
  "ThePrimeagen/harpoon",
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon: Add file",
    },
    {
      "<C-e>",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon: Toggle menu",
    },
  },
}
