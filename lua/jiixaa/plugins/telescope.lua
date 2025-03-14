return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod
    local builtin = require("telescope.builtin")

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    -- LSP-related keymaps
    keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "Find references (LSP)" })
    keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definition (LSP)" })
    keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Go to implementation (LSP)" })
    keymap.set("n", "<leader>ld", builtin.lsp_document_symbols, { desc = "Search document symbols (LSP)" })
    keymap.set("n", "<leader>lw", builtin.lsp_workspace_symbols, { desc = "Search workspace symbols (LSP)" })
    keymap.set("n", "<leader>li", "<cmd>Telescope lsp_incoming_calls<cr>", { desc = "Find incoming calls (LSP)" })
    keymap.set("n", "<leader>lo", "<cmd>Telescope lsp_outgoing_calls<cr>", { desc = "Find outgoing calls (LSP)" })
  end,
}
