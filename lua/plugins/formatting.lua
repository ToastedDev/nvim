return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters.prettier.prepend_args = {
      "--trailing-comma",
      "es5",
      "--no-experimental-ternaries",
    }
  end,
}
