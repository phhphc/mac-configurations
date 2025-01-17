---@type LazySpec
return {
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
