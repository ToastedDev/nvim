return {
  "akinsho/horizon.nvim",
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "#0a0d0f" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0a0d0f" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0a0d0f" })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#272730" })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#17171d" })
      end
    })

    require("horizon").setup()
  end
}
