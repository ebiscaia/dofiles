local atcmd = vim.api.nvim_create_autocmd

atcmd("FileType",
  { pattern = { "python" }, command = [[nmap <F4> <Esc>:w<CR>:TermExec cmd="clear; clear; python3 %"<CR>]] })
atcmd("FileType",
  { pattern = { "python" }, command = [[imap <F4> <Esc>:w<CR>:TermExec cmd="clear; clear; python3 %"<CR>]] })


-- Formatting Files
atcmd("BufWritePre",
  { pattern = { "*.py", "*.lua", "*.html", "*.htm" }, callback = function() vim.lsp.buf.formatting_sync() end })
