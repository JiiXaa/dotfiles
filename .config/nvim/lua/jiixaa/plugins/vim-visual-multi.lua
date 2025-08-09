return {
  "mg979/vim-visual-multi",
  event = "BufReadPre", -- Load before reading a buffer for faster startup
  init = function()
    -- Use plugin's default key mappings (Ctrl-n, Ctrl-Down, etc.)
    vim.g.VM_default_mappings = 1

    -- (Optional) VM_leader sets the leader key for plugin-specific commands
    -- Default is "\\" (backslash). Uncomment to change:
    -- vim.g.VM_leader = "\\"

    -- (Optional) Customize specific mappings if needed (leave empty for defaults)
    -- Example:
    -- vim.g.VM_maps = {
    --   ["Add Cursor Down"] = "<M-j>", -- Alt-j instead of Ctrl-Down
    --   ["Add Cursor Up"]   = "<M-k>", -- Alt-k instead of Ctrl-Up
    -- }
  end,
}
