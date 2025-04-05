return {
  "rose-pine/neovim",
  as = "rose-pine",
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    styles = {
      italic = false,
    },
    palette = {
      moon = {
        _nc = "#16141f",
        base = "#191724",
        surface = "#1f1d2e",
        overlay = "#26233a",
        muted = "#6e6a86",
        subtle = "#908caa",
      },
    },
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
  end,
}
