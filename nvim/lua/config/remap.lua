-- vim.g.mapleader = "," -- maps , as <leader> key
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- <leader>pv opens explorer if normal mode

-- In visual mode, moves highlighted text with uppsercase K and J
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When making full page scrolling with ctrl-j or ctrl-k, mantains cursor in the middle
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")

-- When making searches, mantains cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- When copying an string over a highlighted string (thus replacing it), it doesn't loses
-- the copied string in the buffer.
-- If you do it with p, what remains in the buffer is the deleted word
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Separates vim clipboard from system clipboard.
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Yanks with ctrl-c so it doesn't close Vim
vim.keymap.set("n", "<C-c>", "y")

-- When pressing <leader>s with the cursor over a word, automatically writes the
-- replace command
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.api.nvim_set_keymap('c', '<C-j>', '<C-n>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-k>', '<C-p>', { noremap = true })
