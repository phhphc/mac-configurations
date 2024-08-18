---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- make gr work without delay
        ["grr"] = false,
        ["grn"] = false,
        ["gra"] = false,

        -- add utility
        ["<Leader>W"] = { "<Cmd>wa<CR>", desc = "Save all" },
      },
    },
  },
}
