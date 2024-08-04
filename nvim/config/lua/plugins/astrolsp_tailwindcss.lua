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
      settings.tailwindCSS.classAttributes = { "tw" }
      tailwindcss.settings = settings
      opts.config.tailwindcss = tailwindcss
    end,
  },
}
