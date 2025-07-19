return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "VeryLazy",
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],  -- Use global strategy for all file types
        vim = rainbow_delimiters.strategy["local"],
        javascript = rainbow_delimiters.strategy["global"],  -- Explicitly set global strategy for JavaScript
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
        javascript = "rainbow-delimiters",  -- Ensure the query for JavaScript is correct
      },
      priority = {
        [""] = 110,
        lua = 210,
        javascript = 120,  -- Set priority for JavaScript
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }
  end,
}
