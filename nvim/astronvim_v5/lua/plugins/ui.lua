---@type LazySpec[]
return {
  -- appearence
  { import = "astrocommunity.recipes.disable-tabline" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },

  -- colorscheme
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
