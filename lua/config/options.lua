-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Set default tab configuration to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- Disable relative line numbers
vim.opt.relativenumber = false

vim.g.clipboard = {
  name = "xsel",
  copy = {
    ["+"] = "xsel --input --clipboard",
    ["*"] = "xsel --input --primary",
  },
  paste = {
    ["+"] = "xsel --output --clipboard",
    ["*"] = "xsel --output --primary",
  },
}
