vim.opt.number = true                         -- Set numbers to be shown.
vim.opt.relativenumber = true
vim.opt.cursorline = true                     -- Highlight cursor line underneath the cursor horizontal
vim.opt.cursorcolumn = true                   -- Highlight cursor line underneath the cursor vertically.
vim.opt.shiftwidth=2                          -- size of an indent
vim.opt.tabstop=2                             -- Tab to move by 2 characters
vim.opt.autoindent = true                     -- Enabled automatic indentation
vim.opt.expandtab = true                      -- Replace tabs with with spaces
vim.opt.softtabstop=2                         -- Backspace to remove 2 white spaces at once
vim.opt.scrolloff=10                          -- Show the number of lines before/after when scrolling up/down
vim.opt.ignorecase = true                     -- Ignore capital letters during search.
vim.opt.smartcase = true                      -- Override the ignorecase option if searching for capital letters.
vim.opt.showmode = true                       -- how the mode you are on the last line.
vim.opt.history=500                           -- Set the commands to save in history default number is 20.
vim.opt.splitbelow = true                     -- Define where splits should be shown
vim.opt.clipboard = "unnamedplus"             -- Neovim can use the system clipboard
vim.opt.mouse = "a"                           -- Allows mouse usage
vim.opt.undofile = true                       -- enable persistent undo
vim.opt.signcolumn = "yes"                 -- replace a line number by a sign (linters/fixers)
vim.opt.termguicolors = true                  -- enable more colors
vim.opt.modifiable = true                     -- enable changes using neogit


-- Vim AutoPairs Pluggin
vim.g.AutoPairsShortcutToggle = "<C-y>"
vim.g.AutoPairsShortcutFastWrap = "<C-e>"
