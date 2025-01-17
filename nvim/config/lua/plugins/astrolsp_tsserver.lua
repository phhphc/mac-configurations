---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    --- @param opts AstroLSPOpts
    opts = function(_, opts)
      opts.config.tsserver = {

        settings = {
          typescript = {
            tsserver = {
              -- pluginPaths = { "typescript-plugin-css-modules" },
            },
          },
        },
      }
      -- local tsserver = opts.config.tsserver or {}
      -- local settings = tsserver.settings or {}
      -- settings.typescript = {
      --   tsserver = {
      --     pluginPaths = { "typescript-plugin-css-modules" },
      --   },
      -- }
      -- tsserver.settings = settings
      -- opts.config.tsserver = tsserver
    end,
  },
}
