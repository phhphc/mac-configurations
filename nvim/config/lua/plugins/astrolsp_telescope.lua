return {
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      opts.mappings.n.gr = {
        function() require("telescope.builtin").lsp_references { reuse_win = true } end,
        desc = "Reference of current sumbol",
      }
    end,
  },
}
