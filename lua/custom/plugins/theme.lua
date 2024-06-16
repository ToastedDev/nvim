return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      style = 'night',
      on_highlights = function(hl, colors)
        hl.CursorLineNr = {
          fg = colors.fg
        }
      end
    },
    init = function()
      -- Load the colorscheme here.
      vim.cmd.colorscheme 'tokyonight'
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
