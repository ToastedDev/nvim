return {
  {
    'tpope/vim-fugitive',
    keys = { '<leader>g' },
    config = function()
      vim.keymap.set('n', '<leader>g', vim.cmd.Git, { desc = 'Open [G]it' })
    end,
  },
}
