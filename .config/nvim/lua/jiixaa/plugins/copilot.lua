return {
  "zbirenbaum/copilot.lua",
  build = ":Copilot auth",
  lazy = false,
  opts = {
    suggestion = { enabled = true },
    panel = { enabled = true },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
  end,
}
