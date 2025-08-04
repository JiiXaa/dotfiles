return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true -- Enable timeout for mapped sequences
    vim.o.timeoutlen = 500 -- Timeout delay for key sequences (ms)
  end,
  opts = {
    plugins = {
      spelling = true, -- Show spelling suggestions
      presets = {
        operators = false, -- Don't show mappings for operators like d, c, y
        motions = true, -- Show motion mappings (e.g., ], [)
        text_objects = true, -- Show text object mappings (e.g., a", i()
        windows = true, -- Show window commands (<C-w>)
        nav = true, -- Show navigation mappings (e.g., ]q, [a)
        z = true, -- Show mappings under 'z'
        g = true, -- Show mappings under 'g'
      },
    },
    win = {
      border = "rounded", -- Rounded border for the popup window
    },
    layout = {
      align = "center", -- Center align the popup content
    },
  },
}
