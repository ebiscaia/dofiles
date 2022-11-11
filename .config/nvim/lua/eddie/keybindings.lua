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
keymap("n", "<leader>vr", ":source %", opts)

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
keymap("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope grep_string<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope resume<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Gitsigns
keymap("n", "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
keymap("n", "<leader>ph", "<cmd>Gitsigns preview_hunk<CR>", opts)

-- Neogit
keymap("n", "<leader>ng", "<cmd>Neogit<CR>", opts)

-- LSP
keymap("n", "<leader>ll", "<cmd>MasonInfo<CR>", opts)
keymap("n", "<leader>li", "<cmd>MasonInstallInfo<CR>", opts)

-- Format files
keymap("n", "<C-f>", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)

-- Diff View
keymap("n", "<leader>do", ":DiffviewOpen<CR>", opts)
keymap("n", "<leader>dc", ":DiffviewClose<CR>", opts)

-- Git-conflict
--[[  keymap("n", "<leader>co", ":GitConflictChooseOurs<CR>", opts)
keymap("n", "<leader>ct", ":GitConflictChooseTheirs<CR>", opts)
keymap("n", "<leader>cb", ":GitConflictChooseBoth<CR>", opts)
keymap("n", "<leader>cn", ":GitConflictChoosNone<CR>", opts)
keymap("n", "<leader>qf", ":GitConflictQf<CR>", opts)
keymap("n", "<M-Up>", ":GitConflictChooseNextConflict<CR>", opts)
keymap("n", "<M-Down>", ":GitConflictChoosePreviuosConflict<CR>", opts) ]]

-- DAP
-- keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
-- keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
-- keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
-- keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
-- keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
-- keymap("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
-- keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil,nil,vim.fn.input('Log point message: '))<CR>", opts)
-- keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
