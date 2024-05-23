return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        view_options = {
          show_hidden = true,
        },
      }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'oil',
        callback = function()
          vim.opt_local.colorcolumn = ''
          vim.opt_local.number = false
        end,
      })

      vim.keymap.set('n', '<C-e>', function()
        require('oil').toggle_float()
      end)
    end,
  },
}
