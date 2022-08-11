local atcmd = vim.api.nvim_create_autocmd

atcmd("FileType", { pattern = { "python" }, command = [[nmap <F5> <Esc>:w<CR>:TermExec cmd="<ESC>;python3 %"<CR>]] })
atcmd("FileType", { pattern = { "python" }, command = [[imap <F5> <Esc>:w<CR>:TermExec cmd="<ESC>;python3 %"<CR>]] })






-- Formatting Files
atcmd("BufWritePre", { pattern = { "*.py", "*.lua" }, callback = function() vim.lsp.buf.formatting_sync() end })
