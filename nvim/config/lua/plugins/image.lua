---@type LazySpec
return {
  { import = "astrocommunity.media.image-nvim" },
  {
    "3rd/image.nvim",
    opts = {
      tmux_show_only_in_active_window = true,
    },
  },
}
