-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
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
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'html',
      'astro',
      'markdown.mdx',
    },
    opts = {},
  },
  {
    'laytan/cloak.nvim',
    event = 'VeryLazy',
    config = function()
      require('cloak').setup {
        enabled = true,
        cloak_character = '*',
        highlight_group = 'Comment',
        cloak_length = nil,
        try_all_patterns = true,
        patterns = {
          {
            file_pattern = '.env*',
            cloak_pattern = '=".+"',
            replace = nil,
          },
        },
      }
    end,
  },
  {
    'supermaven-inc/supermaven-nvim',
    opts = {},
  },
  {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
    opts = function()
      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      local null_ls = require 'null-ls'

      FormattingEnabled = true

      vim.api.nvim_create_user_command('FormattingEnable', function()
        FormattingEnabled = true
      end, {})

      vim.api.nvim_create_user_command('FormattingDisable', function()
        FormattingEnabled = false
      end, {})

      vim.keymap.set('n', '<leader>fm', function()
        vim.lsp.buf.format { async = true }
      end, { desc = '[F]or[m]at buffer' })

      local opts = {
        sources = {
          null_ls.builtins.formatting.prettierd.with {
            extra_filetypes = { 'astro', 'mdx', 'ejs' },
          },
          null_ls.builtins.formatting.stylua,
        },
        on_attach = function(client, bufnr)
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds {
              group = augroup,
              buffer = bufnr,
            }
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                if FormattingEnabled == true then
                  vim.lsp.buf.format { bufnr = bufnr }
                end
              end,
            })
          end
        end,
      }
      return opts
    end,
  },
}
