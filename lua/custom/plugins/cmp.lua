return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'mattn/emmet-vim',
      'dcampos/cmp-emmet-vim',
      'windwp/nvim-autopairs',
      'windwp/nvim-ts-autotag',
      {
        'supermaven-inc/supermaven-nvim',
        opts = {
          log_level = 'off',
        },
      },
    },
    config = function()
      require('nvim-autopairs').setup {}
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-ts-autotag').setup {}

      -- Setup LuaSnip
      local luasnip = require 'luasnip'
      luasnip.config.setup {}
      -- Add custom snippets
      local s = luasnip.snippet
      local i = luasnip.insert_node
      local t = luasnip.text_node
      -- Better ! snippet for HTML
      luasnip.add_snippets('html', {
        s('!', {
          t { '<!DOCTYPE html>' },
          t { '', '<html lang="en">' },
          t { '', '  <head>' },
          t { '', '    <meta charset="UTF-8">' },
          t { '', '    <meta name="viewport" content="width=' },
          i(1, 'device-width'),
          t ', initial-scale=',
          i(2, '1.0'),
          t '">',
          t { '', '    <title>' },
          i(3, 'Document'),
          t '</title>',
          t { '', '  </head>' },
          t { '', '  <body>' },
          t { '', '    ' },
          i(4),
          t { '', '  </body>' },
          t { '', '</html>' },
        }),
      })

      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'

      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'emmet_vim' },
        },
      }
    end,
  },
}
