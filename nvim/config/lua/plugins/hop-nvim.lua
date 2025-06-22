---@type LazySpec
return {
  "smoka7/hop.nvim",
  event = "VeryLazy",
  opts = {},
  specs = {
    {
      optional = true,
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["sw"] = {
              function()
                require("hop").hint_words {
                  direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                  hint_position = require("hop.hint").HintPosition.BEGIN,
                }
              end,
              desc = "Hop hint words",
            },
            ["sb"] = {
              function()
                require("hop").hint_words {
                  direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                  hint_position = require("hop.hint").HintPosition.BEGIN,
                }
              end,
              desc = "Hop hint words",
            },
            ["se"] = {
              function()
                require("hop").hint_words {
                  direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                  hint_position = require("hop.hint").HintPosition.END,
                }
              end,
              desc = "Hop hint words",
            },
            ["sj"] = {
              function() require("hop").hint_lines { direction = require("hop.hint").HintDirection.AFTER_CURSOR } end,
              desc = "hop hint lines",
            },
            ["sk"] = {
              function() require("hop").hint_lines { direction = require("hop.hint").HintDirection.BEFORE_CURSOR } end,
              desc = "hop hint lines",
            },
          },
          v = {
            ["sw"] = {
              function()
                require("hop").hint_words {
                  direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                  hint_position = require("hop.hint").HintPosition.BEGIN,
                }
              end,
              desc = "Hop hint words",
            },
            ["sb"] = {
              function()
                require("hop").hint_words {
                  direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                  hint_position = require("hop.hint").HintPosition.BEGIN,
                }
              end,
              desc = "Hop hint words",
            },
            ["se"] = {
              function()
                require("hop").hint_words {
                  direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                  hint_position = require("hop.hint").HintPosition.END,
                }
              end,
              desc = "Hop hint words",
            },
            ["sj"] = {
              function() require("hop").hint_lines { direction = require("hop.hint").HintDirection.AFTER_CURSOR } end,
              desc = "hop hint lines",
            },
            ["sk"] = {
              function() require("hop").hint_lines { direction = require("hop.hint").HintDirection.BEFORE_CURSOR } end,
              desc = "hop hint lines",
            },
          },
        },
      },
    },
    {
      optional = true,
      "catppuccin",
      ---@module "catppuccin"
      ---@type CatppuccinOptions
      opts = { integrations = { hop = true } },
    },
  },
}
