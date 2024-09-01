if not vim.g.vscode then return {} end -- don't do anything in non-vscode instances

---@type LazySpec
return {
  { import = "astrocommunity.recipes.vscode" },
  { "kylechui/nvim-surround", cond = true },
  { "smoka7/hop.nvim", cond = true },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          ["gl"] = function() require("vscode-neovim").action "editor.action.showHover" end,
        },
      },
    },
  },
}
