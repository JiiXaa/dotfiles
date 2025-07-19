return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },  -- Load plugin on buffer read or new file creation to optimize startup time
  config = function()
    local substitute = require("substitute")  -- Require the substitute module

    substitute.setup()  -- Initialize the plugin with default settings

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- Normal mode: Substitute with a motion
    keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })

    -- Normal mode: Substitute the entire line
    keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })

    -- Normal mode: Substitute from the cursor to the end of the line
    keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })

    -- Visual mode: Substitute the selected text
    keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
  end,
}
