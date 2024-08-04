return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts) opts.window.position = "float" end,
  keys = {
    {
      "<leader>e",
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
      mode = { "n" },
      desc = "NeoTree Focus",
    },
  },
}
