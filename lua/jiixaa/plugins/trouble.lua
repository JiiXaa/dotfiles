return {
  "folke/trouble.nvim",
  opts = {}, -- default options
  cmd = "Trouble",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Open/close trouble list (Diagnostics)",
    },
    {
      "<leader>xw",
      "<cmd>Trouble diagnostics toggle filter.scope=workspace<cr>",
      desc = "Open trouble workspace diagnostics",
    },
    {
      "<leader>xd",
      "<cmd>Trouble diagnostics toggle filter.scope=document<cr>",
      desc = "Open trouble document diagnostics",
    },
    {
      "<leader>xq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Open trouble quickfix list",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Open trouble location list",
    },
    {
      "<leader>xt",
      "<cmd>TodoTrouble<CR>",
      desc = "Open todos in trouble",
    },
  },
}
