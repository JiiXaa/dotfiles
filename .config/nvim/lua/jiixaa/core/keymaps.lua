vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Scroll down 3 lines with Ctrl+j
keymap.set("n", "<C-j>", "3<C-e>", { noremap = true, silent = true, desc = "Scroll view down 3 lines" })

-- Scroll up 3 lines with Ctrl+k
keymap.set("n", "<C-k>", "3<C-y>", { noremap = true, silent = true, desc = "Scroll view up 3 lines" })

-- Save file with Ctrl+s
keymap.set("n", "<C-s>", "<cmd>w<CR>", { noremap = true, silent = true })

-- Quit neoVim
keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { noremap = true, silent = true })

-- Select all text
keymap.set("n", "<leader>a", "ggVG", { noremap = true, silent = true })

-- Visual mode mapping to copy to clipboard
keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

-- Normal mode mapping to copy from the cursor to the end of line to clipboard
keymap.set("n", "<leader>Y", '"+yg_', { noremap = true, silent = true })

-- Normal mode mapping to copy the current line to clipboard
keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })

-- Normal mode mapping to copy the entire line to clipboard
keymap.set("n", "<leader>yy", '"+yy', { noremap = true, silent = true })

-- Visual mode mapping to cut to clipboard
keymap.set("v", "<leader>x", '"+x', { noremap = true, silent = true })

-- Normal mode mapping to cut the current line to clipboard
keymap.set("n", "<leader>dd", '"+dd', { noremap = true, silent = true })

-- Normal mode mapping to cut from the cursor to the end of line to clipboard
keymap.set("n", "<leader>D", '"+D', { noremap = true, silent = true })

-- Normal mode mapping to paste from clipboard
keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })
keymap.set("n", "<leader>P", '"+P', { noremap = true, silent = true })

-- Visual mode mapping to paste from clipboard
keymap.set("v", "<leader>p", '"+p', { noremap = true, silent = true })
keymap.set("v", "<leader>P", '"+P', { noremap = true, silent = true })

-- Exit insert mode with 'jk'
keymap.set("i", "jk", "<ESC>")

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- increment/decrement numbers
keymap.set("n", "<C-a>", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>=", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal size
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- got to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
