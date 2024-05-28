-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'supermaven-inc/supermaven-nvim', opts = {} },
  { 'andweeb/presence.nvim', lazy = false },
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>g', vim.cmd.Git, { desc = 'Open [G]it' })
    end,
  },
}
