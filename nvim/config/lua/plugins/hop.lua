return {
  "smoka7/hop.nvim",
  opts = {},
  keys = {
    {
      "s",
      function() require("hop").hint_char2 {} end,
      mode = { "n" },
      desc = "Hop hint words",
    },
    {
      "s",
      function() require("hop").hint_char2 { extend_visual = true } end,
      mode = { "v" },
      desc = "Hop hint words",
    },
  },
}
