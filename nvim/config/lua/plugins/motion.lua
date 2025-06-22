---@diagnostic disable: missing-fields
---@type LazySpec[]
return {
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.marks-nvim" },
  {
    "smoka7/hop.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {

      {
        "sw",
        function()
          require("hop").hint_words {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            hint_position = require("hop.hint").HintPosition.BEGIN,
          }
        end,
        desc = "Hop hint words",
        mode = { "n", "v" },
      },
      {
        "sb",
        function()
          require("hop").hint_words {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            hint_position = require("hop.hint").HintPosition.BEGIN,
          }
        end,
        desc = "Hop hint words",
        mode = { "n", "v" },
      },
      {
        "se",
        function()
          require("hop").hint_words {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            hint_position = require("hop.hint").HintPosition.END,
          }
        end,
        desc = "Hop hint words",
        mode = { "n", "v" },
      },
      {
        "sj",
        function() require("hop").hint_lines { direction = require("hop.hint").HintDirection.AFTER_CURSOR } end,
        desc = "hop hint lines",
        mode = { "n", "v" },
      },
      {
        "sk",
        function() require("hop").hint_lines { direction = require("hop.hint").HintDirection.BEFORE_CURSOR } end,
        desc = "hop hint lines",
        mode = { "n", "v" },
      },
    },
    specs = {
      {
        optional = true,
        "catppuccin",
        ---@module "catppuccin"
        ---@type CatppuccinOptions
        opts = { integrations = { hop = true } },
      },
    },
  },
}
