return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = true },  -- Enables inline code suggestions
    panel = { enabled = true },  -- Enables the Copilot suggestions panel
    filetypes = {
      markdown = true,  -- Enables Copilot for markdown files
      help = true,  -- Enables Copilot for help files
      -- You can add more filetypes here as needed
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)

    -- Keybindings for Copilot
    -- vim.api.nvim_set_keymap("i", "<C-f>", "copilot#Accept('<CR>')", { expr = true, noremap = true, silent = true, desc = "Accept Copilot Suggestion" })
    -- vim.api.nvim_set_keymap("i", "<C-n>", "copilot#Next()", { expr = true, noremap = true, silent = true, desc = "Next Copilot Suggestion" })
    -- vim.api.nvim_set_keymap("i", "<C-p>", "copilot#Previous()", { expr = true, noremap = true, silent = true, desc = "Previous Copilot Suggestion" })
    -- vim.api.nvim_set_keymap("i", "<C-x>", "copilot#Dismiss()", { expr = true, noremap = true, silent = true, desc = "Dismiss Copilot Suggestion" })
  end,
}