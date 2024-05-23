return {
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
