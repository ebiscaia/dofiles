local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "Nop", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--    normal mode =         "n"
--    insert mode =         "i"
--    visual mode =         "v"
--    visual block mode =   "x"
--    term mode =           "t"
--    command mode =        "c"

-- Normal mode
-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 25<cr>", opts)

-- Resize
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":bn<cr>", opts)
keymap("n", "<S-Tab>", ":bp<cr>", opts)

-- Reload config file
keymap("n", "vr", ":source $HOME/.config/nvim/init.lua", opts)

-- Insert mode
-- Quick way to leave insert mode
keymap("i", "jj", "<ESC>", opts)

-- Visual mode
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual block mode
-- Move text up and down
-- Move text up and down
keymap("v", "<C-j>", ":m .+1<CR>==", opts)
keymap("v", "<C-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Command mode
keymap("c", "jj", "<C-C>", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<C-t>", "<cmd>Telescope live_grep<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

