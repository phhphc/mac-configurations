---@type LazySpec
return {
  { import = "astrocommunity.recipes.disable-tabline" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  -- icon config
  { import = "astrocommunity.recipes.vscode-icons" },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      icons = {
        ArrowLeft = "",
        ArrowRight = "",
      },
    },
  },
  -- theme config
  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "catppuccin",
      highlights = {
        ["catppuccin-mocha"] = {
          SpellBad = {
            undercurl = true,
            sp = "#a6e3a1",
          },
        },
      },
    },
  },
}
