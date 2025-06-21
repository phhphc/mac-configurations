---@type LazySpec[]
return {
  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "catppuccin-mocha",
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
