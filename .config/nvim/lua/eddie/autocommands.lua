local atcmd = vim.api.nvim_create_autocmd

atcmd("FileType", { pattern = { "python" }, command = [[nmap <F5> <Esc>:w<CR>:TermExec cmd="python3 %"<CR>]] })
atcmd("FileType", { pattern = { "python" }, command = [[imap <F5> <Esc>:w<CR>:TermExec cmd="python3 %"<CR>]] })
atcmd("BufWritePre", { pattern = { "*.py" }, callback = function () vim.lsp.buf.format() end })

-- -- if client.supports_method("textDocument/formatting") then
-- 	atcmd("BufWritePre", {
-- 		callback = function() vim.lsp.buf.format() end,
-- 		group = vim.api.nvim_create_augroup("lsp_document_format", {clear = true}),
-- 		buffer = 0
-- 	})
--  -- end




-- local api = vim.api
-- -- -- go to last loc when opening a buffer
-- --  api.nvim_create_autocmd(
-- --    "BufReadPost",
-- --    { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
-- --  )
-- --
-- --
-- ---- windows to close with "q"
-- api.nvim_create_autocmd(
--   "FileType",
--   --{ pattern = { "python" }, command = [[nmap <F5> <Esc>:w<CR>:!clear;python3 %<CR>]] }
--   { pattern = { "python" }, command = [[nmap <F5> <Esc>:w<CR>:term python3 %<CR>]] }
-- )
