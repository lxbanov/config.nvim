local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

map("n", "<leader>sv", "<C-w>v", { desc = "Split vertical" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit" })

map("v", "<", "<gv")
map("v", ">", ">gv")

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered when jumping
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
map("n", "n", "nzzzv", { desc = "Next match" })
map("n", "N", "Nzzzv", { desc = "Prev match" })

-- Paste over selection without clobbering the register
map("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Join lines without moving the cursor
map("n", "J", "mzJ`z", { desc = "Join lines" })

-- Terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- Jump straight to another window from the terminal, no escape step
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Window left" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Window down" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Window up" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Window right" })
map("n", "<leader>tt", "<cmd>split | terminal<CR>", { desc = "Terminal" })

-- Misc
map("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Mason" })
map("n", "<leader>x", "<cmd>source %<CR>", { desc = "Source current file" })

-- Insert-mode cursor movement on Alt/Option + hjkl.
-- Terminals must send Option as Alt (Meta); see notes in the README.
map("i", "<M-h>", "<Left>", { desc = "Left" })
map("i", "<M-j>", "<Down>", { desc = "Down" })
map("i", "<M-k>", "<Up>", { desc = "Up" })
map("i", "<M-l>", "<Right>", { desc = "Right" })
map("i", "<M-b>", "<C-o>b", { desc = "Prev word" })
map("i", "<M-w>", "<C-o>w", { desc = "Next word" })
map("i", "<M-0>", "<C-o>0", { desc = "Line start" })
map("i", "<M-4>", "<C-o>$", { desc = "Line end" })
