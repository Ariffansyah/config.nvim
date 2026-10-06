-- Custom Base16 colorscheme - matches Waywallen video wallpaper (Proguild3.mp4) + Noctalia desktop
-- Wallpaper blues extracted: schemecolor #0e2640, palette #2a4a6b #336593 #63a4d9
local colors = {
  base00 = "#131313", -- Background (window_bg)
  base01 = "#1a2433", -- Lighter bg - blue-tinted (mix #131313 + #0e2640)
  base02 = "#2a4a6b", -- Selection background (video palette 42,74,107)
  base03 = "#7a8da6", -- Comments (blue-grey)
  base04 = "#8aa0b8", -- Muted fg
  base05 = "#e2e2e2", -- Foreground (window_fg, keep readable)
  base06 = "#c6d0de", -- Light blue-grey
  base07 = "#ffffff", -- Bright white
  base08 = "#8ab4e0", -- Red -> blue (was #ffb4ab pink, now blue to match wallpaper)
  base09 = "#c6d0de", -- Orange -> light blue-grey
  base0A = "#c6d0de", -- Yellow -> light blue-grey
  base0B = "#63a4d9", -- Keywords - wallpaper bright blue (99,164,217)
  base0C = "#8ab4e0", -- Functions - light blue
  base0D = "#336593", -- Types - mid blue (51,101,147)
  base0E = "#5a8ec2", -- Operators - blue
  base0F = "#7a8da6", -- Brown -> blue-grey
}

vim.g.colors_name = "base16"

-- Set terminal colors to match wallpaper blues + Noctalia (no pink)
local terminal_ansi_colors = {
  "#1a2433", -- black (blue dark)
  "#8ab4e0", -- red -> blue (was #ffb4ab)
  "#63a4d9", -- green -> blue
  "#c6d0de", -- yellow -> light blue-grey
  "#336593", -- blue (51,101,147)
  "#5a8ec2", -- magenta -> blue
  "#8ab4e0", -- cyan (light blue)
  "#e2e2e2", -- white
  "#7a8da6", -- bright black (blue-grey)
  "#8ab4e0", -- bright red -> blue
  "#63a4d9", -- bright green -> blue
  "#c6d0de", -- bright yellow
  "#336593", -- bright blue
  "#5a8ec2", -- bright magenta
  "#8ab4e0", -- bright cyan
  "#ffffff", -- bright white
}

for i, color in ipairs(terminal_ansi_colors) do
  vim.g["terminal_color_" .. (i - 1)] = color
end

vim.cmd("highlight clear")

local highlights = {
  -- Base colors
  Normal = { bg = colors.base00, fg = colors.base05 },
  NormalFloat = { bg = colors.base00, fg = colors.base05 },
  FloatBorder = { fg = colors.base0B, bg = colors.base00 },
  CursorLine = { bg = colors.base01 },
  Visual = { bg = colors.base02, fg = colors.base05 },

  -- LSP Diagnostics (blue, no pink)
  DiagnosticError = { fg = "#8ab4e0", bold = true },
  DiagnosticWarn = { fg = colors.base06, bold = true },
  DiagnosticInfo = { fg = colors.base05 },
  DiagnosticHint = { fg = colors.base04 },
  DiagnosticUnderlineError = { undercurl = true, sp = "#8ab4e0" },
  DiagnosticUnderlineWarn = { undercurl = true, sp = colors.base06 },

  -- Statusline / Bottom Bar (Separation from code)
  StatusLine = { fg = colors.base05, bg = colors.base01 }, -- Light bg for contrast
  StatusLineNC = { fg = colors.base03, bg = colors.base01 }, -- Inactive bar
  MsgArea = { fg = colors.base05, bg = colors.base00 }, -- Command area contrast
  ModeMsg = { fg = colors.base0B, bold = true }, -- "INSERT" / "NORMAL" text

  -- Neo-tree / Sidebars
  NeoTreeNormal = { bg = colors.base00 },
  NeoTreeNormalNC = { bg = colors.base00 },

  -- Generic UI elements
  Directory = { fg = colors.base0C, bold = true },
  SpecialKey = { fg = colors.base0C },
  Title = { fg = colors.base0C, bold = true },
  Keyword = { fg = colors.base0B },
  Identifier = { fg = colors.base0C },
  Function = { fg = colors.base0C },
  Statement = { fg = colors.base0B },
  PreProc = { fg = colors.base0C },
  Operator = { fg = colors.base0E },

  -- Telescope
  TelescopeNormal = { fg = colors.base0C },
  TelescopeBorder = { fg = colors.base0C },
  TelescopePromptPrefix = { fg = colors.base0C },
  TelescopePromptNormal = { fg = colors.base0C },
  TelescopePromptBorder = { fg = colors.base0C },
  TelescopeSelection = { fg = colors.base0C, bg = colors.base02, bold = true },
  TelescopeSelectionCaret = { fg = colors.base0C },
  TelescopeMatching = { fg = colors.base0C, bold = true },

  -- LazyVim specific
  LazyH1 = { fg = colors.base0C, bold = true },
  LazyH2 = { fg = colors.base0C, bold = true },
  LazyButton = { fg = colors.base0C },
  LazyButtonActive = { fg = colors.base0C, bold = true },
  LazyComment = { fg = colors.base03 },

  -- Scrollbar and UI elements
  Cursor = { bg = colors.base0C, fg = colors.base00 },
  TermCursorNC = { bg = colors.base0C },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

-- Transparent background (lives here so :colorscheme re-applies it)
for _, group in ipairs({
  "Normal",
  "NormalFloat",
  "NormalNC",
  "FloatBorder",
  "Pmenu",
  "Terminal",
  "EndOfBuffer",
  "FoldColumn",
  "Folded",
  "SignColumn",
  "WhichKeyFloat",
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeVertSplit",
  "NeoTreeWinSeparator",
  "NeoTreeEndOfBuffer",
  "NotifyINFOBody",
  "NotifyERRORBody",
  "NotifyWARNBody",
  "NotifyTRACEBody",
  "NotifyDEBUGBody",
  "NotifyINFOTitle",
  "NotifyERRORTitle",
  "NotifyWARNTitle",
  "NotifyTRACETitle",
  "NotifyDEBUGTitle",
  "NotifyINFOBorder",
  "NotifyERRORBorder",
  "NotifyWARNBorder",
  "NotifyTRACEBorder",
  "NotifyDEBUGBorder",
}) do
  vim.api.nvim_set_hl(0, group, { bg = "none" })
end
