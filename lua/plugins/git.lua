return {
  {
    "tpope/vim-fugitive",
    keys = { "<leader>g" },
    config = function()
      vim.keymap.set("n", "<leader>g", vim.cmd.Git, { desc = "Open [G]it" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "fugitive",
        callback = function()
          local bufnr = vim.api.nvim_get_current_buf()
          local opts = { buffer = bufnr, remap = false }

          vim.keymap.set("n", "P", function()
            vim.cmd.Git("push")
          end, opts)

          vim.keymap.set("n", "p", function()
            vim.cmd.Git("pull")
          end, opts)

          vim.keymap.set("n", "U", function()
            local current_branch = vim.cmd.Git("rev-parse --abbrev-ref HEAD")
            return vim.cmd.Git("push --set-upstream origin ") .. current_branch
          end, opts)
        end,
      })
    end,
  },
}
