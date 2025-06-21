---@type LazySpec
return {
  {
    -- kitty scrollback buffer
    "mikesmithgh/kitty-scrollback.nvim",
    version = "^5.0.0",
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    config = function() vim.opt.showtabline = 0 end,
  },
}
