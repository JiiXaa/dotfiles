return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neotree = require("neo-tree")

    neotree.setup({
      window = {
        position = "left",
        width = 35,
      },

      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = { ".DS_Store" },
        },
      },

      default_component_configs = {
        indent = { with_markers = true },
        icon = {
          folder_closed = "",
          folder_open = "",
        },
      },
    })

    vim.keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
    vim.keymap.set("n", "<leader>ef", "<cmd>Neotree reveal<CR>", { desc = "Reveal current file in Neo-tree" })
    vim.keymap.set("n", "<leader>eb", "<cmd>Neotree buffers toggle<CR>", { desc = "Toggle Buffers in Neo-tree" })
    vim.keymap.set("n", "<leader>eg", "<cmd>Neotree git_status toggle<CR>", { desc = "Toggle Git Status in Neo-tree" })
    vim.keymap.set(
      "n",
      "<leader>er",
      "<cmd>Neotree close<CR> | <cmd>Neotree reveal<CR>",
      { desc = "Soft Refresh Neo-tree" }
    )
    vim.keymap.set("n", "<leader>ew", "<cmd>Neotree focus<CR>", { desc = "Focus on Neo-tree" })
    vim.keymap.set("n", "<leader>eC", "<cmd>Neotree close<CR>", { desc = "Close Neo-tree" })
  end,
}
