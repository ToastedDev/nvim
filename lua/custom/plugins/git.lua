return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'tpope/vim-fugitive',
    keys = { '<leader>g' },
    config = function()
      vim.keymap.set('n', '<leader>g', vim.cmd.Git, { desc = 'Open [G]it' })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'fugitive',
        callback = function()
          local bufnr = vim.api.nvim_get_current_buf()
          local opts = { buffer = bufnr, remap = false }

          vim.keymap.set('n', 'P', function()
            vim.cmd.Git 'push'
          end, opts)

          vim.keymap.set('n', 'p', function()
            vim.cmd.Git 'pull'
          end, opts)

          vim.keymap.set('n', 'U', ':Git push -u origin ', opts)
        end,
      })
    end,
  },
}
