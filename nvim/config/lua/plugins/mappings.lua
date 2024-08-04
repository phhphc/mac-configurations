return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
      mappings = {
        -- first key is the mode
        n = {
          ["H"] = { "Hzz", desc = "Go to botton line" },
          ["L"] = { "Lzz", desc = "Go to top line" },

          -- git section
          ["<leader>gd"] = false,
          ["<leader>gdo"] = { "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
          ["<leader>gdc"] = { "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
          ["<leader>gdr"] = { "<cmd>DiffviewRefresh<cr>", desc = "Diffview Refresh" },
          ["<leader>gdh"] = { "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
          ["<leader>gdd"] = { ":DiffviewOpen<space>", desc = "Diffview Open (with config)" },
          ["<leader>gdf"] = {
            ":DiffviewFileHistory<space>",
            desc = "Diffview File History (with config)",
          },
        },
      },
    },
  },
}
