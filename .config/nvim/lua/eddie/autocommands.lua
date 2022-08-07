local atcmd = vim.api.nvim_create_autocmd

atcmd("FileType", { pattern = { "python" }, command = [[nmap <F5> <Esc>:w<CR>:TermExec cmd="python3 %"<CR>]] })
atcmd("FileType", { pattern = { "python" }, command = [[imap <F5> <Esc>:w<CR>:TermExec cmd="python3 %"<CR>]] })
atcmd("BufWritePre", { pattern = { "*.py" }, callback = function () vim.lsp.buf.formatting_sync() end })
