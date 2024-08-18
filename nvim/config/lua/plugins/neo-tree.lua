---@type LazySpec
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "current",
      },
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
      mappings = {
        n = {
          ["<Leader>e"] = {
            function()
              local reveal_file = vim.fn.expand "%:p"
              local curr_dir = vim.fn.getcwd()
              local file_in_dir = reveal_file:sub(1, #curr_dir) == curr_dir
              local opts = {
                source = "last",
                toggle = true,
                reveal = file_in_dir,
              }
              require("neo-tree.command").execute(opts)
            end,
            desc = "NeoTree Focus",
          },
        },
      },
    },
  },
}
