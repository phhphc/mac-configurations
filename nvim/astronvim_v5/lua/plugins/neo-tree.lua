---@type LazySpec[]
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      window = { position = "float" },
    },
    keys = {
      {
        "<Leader>e",
        function()
          local reveal_file = vim.fn.expand "%:p"
          local curr_dir = vim.fn.getcwd()
          local is_file_in_dir = reveal_file:sub(1, #curr_dir) == curr_dir
          local opts = {
            source = "last",
            reveal = is_file_in_dir,
          }
          require("neo-tree.command").execute(opts)
        end,
        desc = "NeoTree Focus",
      },
    },
  },
}
