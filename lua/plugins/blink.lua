return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ["<C-k>"] = { "select_prev", "fallback" },
      -- Set here so LazyVim doesn't add ghost-text accept to Tab: that's Alt+L and Right at line end.
      ["<Tab>"] = { "snippet_forward", "fallback" },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    completion = {
      menu = { border = "rounded" },
      documentation = { window = { border = "rounded" }, auto_show = true },
    },
    signature = { enabled = true, window = { border = "rounded" } },
  },
}
