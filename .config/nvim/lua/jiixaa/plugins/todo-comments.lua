-- Available todo comments:
-- PERF: This is a performance improvement / fully optimized
-- HACK: This is a hack / workaround / temporary fix
-- TODO: This is a task that needs to be done
-- NOTE: This is a note / important information
-- FIX: This is a bug that needs to be fixed
-- WARNING: This is a warning / potential issue
return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()
  end,
}
