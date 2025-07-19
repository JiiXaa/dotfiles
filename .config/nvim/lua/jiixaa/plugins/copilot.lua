return {
  "zbirenbaum/copilot.lua",
  build = ":Copilot auth",
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
