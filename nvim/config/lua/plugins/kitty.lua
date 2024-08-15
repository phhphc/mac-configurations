---@type LazySpec
return {
  {
    -- kitty scrollback buffer
    "mikesmithgh/kitty-scrollback.nvim",
    lazy = true,
    version = "^5.0.0",
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    opts = {
      ksb_builtin_get_text_all = {
        kitty_get_text = {
          ansi = true,
        },
      },
    },
  },
  -- kitty & nvim seamless navigate
  { "mrjones2014/smart-splits.nvim", build = "./kitty/install-kittens.bash" },
}
