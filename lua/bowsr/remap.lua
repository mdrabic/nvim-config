vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--yank block of text into your system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

--no-op force quit
vim.keymap.set("n", "Q", "<nop>")

--C-c to exist i mode will not trigger insertExit events
vim.keymap.set("i", "<C-c>", "<Esc>")
