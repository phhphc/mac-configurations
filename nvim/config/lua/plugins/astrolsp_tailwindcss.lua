---@type LazySpec
return {
  { import = "astrocommunity.pack.tailwindcss" },
  {
    "AstroNvim/astrolsp",
    --- @param opts AstroLSPOpts
    opts = function(_, opts)
      local tailwindcss = opts.config.tailwindcss or {}
      local settings = tailwindcss.settings or {}
      settings.tailwindCSS = settings.tailwindCSS or {}
      settings.tailwindCSS.classAttributes = { "tw", "className" }
      settings.tailwindCSS.experimental = settings.tailwindCSS.experimental or {}
      settings.tailwindCSS.experimental.classRegex = {
        "tw`([^`]*)`",
        "tw\\.[a-z]+`([^`]*)`",
        "tw\\([a-zA-Z0-9]*\\)`([^`]*)`",
        -- "(?:tw|tw\\.)`([^`]*)`",
      }
      tailwindcss.settings = settings
      tailwindcss.root_dir = function(fname)
        local root_pattern = require("lspconfig").util.root_pattern(
          "tailwind.config.mjs",
          "tailwind.config.cjs",
          "tailwind.config.js",
          "tailwind.config.ts",
          "postcss.config.js",
          "config/tailwind.config.js",
          "configs/tailwind.config.js",
          "assets/tailwind.config.js"
        )
        return root_pattern(fname)
      end
      opts.config.tailwindcss = tailwindcss
    end,
  },
}
