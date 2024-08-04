return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults.initial_mode = "normal"
      opts.pickers = {
        lsp_references = { fname_width = 999 },
        lsp_implementations = { fname_width = 999 },
        lsp_definitions = { fname_width = 999 },
        find_files = { initial_mode = "insert" },
        live_grep = { initial_mode = "insert" },
        commands = { initial_mode = "insert" },
        man_pages = { initial_mode = "insert" },
        keymaps = { initial_mode = "insert" },
        help_tags = { initial_mode = "insert" },
      }
    end,
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
      mappings = {
        n = {
          ["<Leader>o"] = {
            function() require("telescope.builtin").buffers { sort_lastused = true } end,
            desc = "Recent Buffer",
          },
        },
      },
    },
  },
}
