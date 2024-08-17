---@type LazySpec
return {
  {
    -- kitty scrollback buffer
    "mikesmithgh/kitty-scrollback.nvim",
    lazy = true,
    version = "^5.0.0",
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    config = function ()
        vim.opt.showtabline = 0
    end
  },
  -- kitty & nvim seamless navigate
  { "mrjones2014/smart-splits.nvim", build = "./kitty/install-kittens.bash" },
}
