local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon.nav_file(4) end)

vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
