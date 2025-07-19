return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",  -- Set the mode to display buffers as tabs
      separator_style = "slant",  -- Use slanted separators
      diagnostics = "nvim_lsp",  -- Show LSP diagnostics in the bufferline
    },
  },
}
