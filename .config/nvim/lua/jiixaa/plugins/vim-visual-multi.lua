return {
  "mg979/vim-visual-multi",
  event = "BufReadPre", -- Adjust the event as needed
  config = function()
    -- Disable default mappings
    vim.g.VM_default_mappings = 0

    -- Define custom function for visual cursors with delay
    local function visual_cursors_with_delay()
      vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
      vim.cmd("sleep 200m")
      vim.cmd('silent! execute "normal! A"')
    end

    -- Register the function globally if it needs to be accessed by VimScript
    _G.visual_cursors_with_delay = visual_cursors_with_delay

    -- Set custom key mappings
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Visual Multi mappings using <leader> as the prefix
    map("n", "<leader>ma", "<Plug>(VM-Select-All)<Tab>", opts)
    map("n", "<leader>mr", "<Plug>(VM-Start-Regex-Search)", opts)
    map("n", "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", opts)
    map("n", "<leader>mv", "v:lua.visual_cursors_with_delay()", { expr = true, noremap = true, silent = true })
    map("n", "<leader>mo", "<Plug>(VM-Toggle-Mappings)", opts)
    map("n", "<leader>mn", "<Plug>(VM-Find-Under)", opts)
  end,
}
