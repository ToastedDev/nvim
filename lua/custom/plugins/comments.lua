return {
  {
    'numToStr/Comment.nvim',
    keys = { 'gc', 'gcc', 'gb', 'gbc' },
    opts = {},
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    keys = { '<leader>sc' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('todo-comments').setup {
        signs = false,
      }

      vim.keymap.set('n', '<leader>sc', '<cmd>TodoTelescope<CR>', { desc = '[S]earch Todo [C]omments' })
    end,
  },
}
