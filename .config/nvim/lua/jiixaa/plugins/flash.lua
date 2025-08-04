return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    labels = "arstneiodhgfpluy", -- home row optimized
    search = {
      mode = "exact",
    },
    jump = {
      autojump = true,
    },
    modes = {
      char = {
        enabled = true,
        -- override to force labels even for few matches
        jump_labels = true, -- enable labels
        keys = { "f", "F", "t", "T", ";", "," },
      },
    },
  },
  keys = {
    {
      "m",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash Jump",
    },
    {
      "M",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash (operator-pending)",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search (operator, visual)",
    },
    {
      "<C-f>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search in command line",
    },
  },
}
