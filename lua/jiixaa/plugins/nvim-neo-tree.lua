return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        width = 30,
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = { ".DS_Store" },
        },
        follow_current_file = true,
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        indent = { with_markers = true },
        icon = {
          folder_closed = "",
          folder_open = "",
        },
      },
    })
  end,
}
