vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project View" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Down" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Wrap Next Line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to Clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to Clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to Clipboard" })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Launch Tmux" })

vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
