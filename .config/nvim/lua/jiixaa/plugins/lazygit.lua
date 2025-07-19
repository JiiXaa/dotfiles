return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    { "<leader>lc", "<cmd>LazyGitConfig<cr>", desc = "Open LazyGit Config" },
    { "<leader>lf", "<cmd>LazyGitCurrentFile<cr>", desc = "Open LazyGit for current file" },
    { "<leader>lF", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "Open LazyGit filter for current file" },
  },
}
