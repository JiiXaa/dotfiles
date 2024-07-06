return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = true,  -- Enable debug mode
      chat = {
        welcome_message = "Hello! How can I assist you today?",  -- Custom welcome message
      },
      completion = {
        enabled = true,  -- Enable completion
        trigger_on_key = true,  -- Trigger completion on keypress
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)

      -- Keybindings for opening and toggling CopilotChat
      vim.api.nvim_set_keymap("n", "<leader>cc", ":CopilotChatOpen<CR>", { noremap = true, silent = true, desc = "Open CopilotChat" })
      vim.api.nvim_set_keymap("n", "<leader>ct", ":CopilotChatToggle<CR>", { noremap = true, silent = true, desc = "Toggle CopilotChat" })
    end,
  },
}
