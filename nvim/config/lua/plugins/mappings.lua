return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["H"] = { "Hzz", desc = "Go to botton line" },
          ["L"] = { "Lzz", desc = "Go to top line" },

          -- quickfix section
          ["]q"] = { "<cmd>cnext<cr>", desc = "Next quickfix" },
          ["[q"] = { "<cmd>cprev<cr>", desc = "Previous quickfix" },
          ["]Q"] = { "<cmd>cnewer<cr><cr>", desc = "Next quickfix list" },
          ["[Q"] = { "<cmd>colder<cr><cr>", desc = "Previous quickfix list" },

          -- explorer section
          ["<leader>e"] = {
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
          ["<leader>o"] = {
            function()
              require("telescope.builtin").buffers {
                sort_lastused = true,
                initial_mode = "normal",
              }
            end,
            desc = "Recent Buffer",
          },

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
        t = {
          ["<F8>"] = { "<C-\\><C-n>" },
        },
      },
    },
  },
}
