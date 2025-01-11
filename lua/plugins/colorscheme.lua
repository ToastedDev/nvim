return {
  "projekt0n/github-nvim-theme",
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    local C = require("github-theme.lib.color")
    require("github-theme").setup({
      specs = {
        all = {
          bg1 = "#010409",
          bg1 = "#010409",
          bg3 = C("#010409"):blend(C("#d9dee3"), 0.1):to_css(),
        },
      },
    })
  end,
}
