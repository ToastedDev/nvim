return {
  {
    'numToStr/Comment.nvim',
    keys = { '<C-_>', '<C-/>', 'gc', 'gcc' },
    config = function()
      require('Comment').setup()

      vim.keymap.set('n', '<C-/>', function()
        require('Comment.api').toggle.linewise.current()
      end, { desc = 'Toggle Comment' })

      vim.keymap.set('n', '<C-_>', function()
        require('Comment.api').toggle.linewise.current()
      end, { desc = 'Toggle Comment' })

      vim.keymap.set('v', '<C-/>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = 'Toggle Comment' })

      vim.keymap.set('v', '<C-_>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = 'Toggle Comment' })
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    keys = { "<leader>sc" },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('todo-comments').setup {
        signs = false,
      }

      vim.keymap.set('n', '<leader>sc', "<cmd>TodoTelescope<CR>", { desc = '[S]earch Todo [C]omments' })
    end,
  },
}
