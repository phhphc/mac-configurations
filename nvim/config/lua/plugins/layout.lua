---@type LazySpec[]
return {
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        opt = {
          showtabline = 0,
        },
      },
    },
  },
}
