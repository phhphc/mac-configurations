---@type LazySpec
return {
  "folke/snacks.nvim",
  keys = {},
  specs = {
    {
      optional = true,
      "AstroNvim/astrolsp",
      ---@type AstroLSPOpts
      opts = {
        mappings = {
          n = {
            ["gd"] = { function() require("snacks.picker").lsp_definitions() end, desc = "Goto Definition" },
            ["gD"] = { function() require("snacks.picker").lsp_declarations() end, desc = "Goto Declaration" },
            ["gr"] = { function() require("snacks.picker").lsp_references() end, nowait = true, desc = "References" },
            ["gi"] = { function() require("snacks.picker").lsp_implementations() end, desc = "Goto Implementation" },
            ["gy"] = { function() require("snacks.picker").lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
            ["go"] = { function() require("snacks.picker").lsp_symbols() end, desc = "LSP Symbols" },
            ["gO"] = { function() require("snacks.picker").lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
          },
        },
      },
    },
  },
}
