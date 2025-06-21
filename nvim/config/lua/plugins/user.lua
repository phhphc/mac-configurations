---@type LazySpec[]
return {
  { "max397574/better-escape.nvim", enabled = false },
  {
    -- disable neovim default lsp keybinding
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["grr"] = false,
          ["grn"] = false,
          ["gra"] = false,
          ["gri"] = false,
        },
      },
    },
  },
}
