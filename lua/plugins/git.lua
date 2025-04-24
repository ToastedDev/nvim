return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = { enabled = true }
    },
    keys = {
      { "<leader>g", function() require('snacks').lazygit() end, desc = "Open [G]it" },
    }
  },
  {
    -- "tpope/vim-fugitive",
    -- dependencies = { "akinsho/toggleterm.nvim", config = true },
    -- keys = {
    --   { "<leader>g", vim.cmd.Git, desc = "Open [G]it" },
    -- },
    -- config = function()
    --   vim.api.nvim_create_autocmd("FileType", {
    --     pattern = "fugitive",
    --     callback = function()
    --       local bufnr = vim.api.nvim_get_current_buf()
    --       local opts = { buffer = bufnr, remap = false }
    --
    --       vim.keymap.set("n", "P", function()
    --         vim.cmd.Git("push")
    --       end, opts)
    --
    --       vim.keymap.set("n", "p", function()
    --         vim.cmd.Git("pull")
    --       end, opts)
    --
    --       vim.keymap.set("n", "U", function()
    --         local current_branch = vim.cmd.Git("rev-parse --abbrev-ref HEAD")
    --         return vim.cmd.Git("push --set-upstream origin ") .. current_branch
    --       end, opts)
    --
    --       vim.keymap.set("n", "cz", function()
    --         local Terminal = require("toggleterm.terminal").Terminal
    --         Terminal:new({
    --           cmd = "git cz",
    --           direction = "float",
    --           on_close = function()
    --             vim.api.nvim_buf_call(bufnr, function()
    --               vim.cmd.edit()
    --             end)
    --           end,
    --         }):toggle()
    --       end)
    --     end,
    --   })
    -- end,
  }
}
