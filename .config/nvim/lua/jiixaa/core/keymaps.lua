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

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- increment/decrement numbers
keymap.set("n", "<C-a>", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>=", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- got to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
