return {
  "ThePrimeagen/harpoon",
  keys = { "<leader>h", "<leader>ah", "<leader>rh", "<leader>1", "<leader>2", "<leader>3", "<leader>4", "<leader>5" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>h", function()
      ui.toggle_quick_menu()
    end, { desc = "Open [H]arpoon Ui" })

    vim.keymap.set("n", "<leader>ah", function()
      mark.add_file()
    end, { desc = "[A]dd File to [H]arpoon" })

    vim.keymap.set("n", "<leader>rh", function()
      mark.rm_file()
    end, { desc = "[R]emove File from [H]arpoon" })

    for i = 1, 5 do
      vim.keymap.set("n", "<leader>" .. i, function()
        ui.nav_file(i)
      end, { desc = "Open [H]arpoon File #[" .. i .. "]" })
    end
  end,
}
