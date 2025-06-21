---@type LazySpec
return {
  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
