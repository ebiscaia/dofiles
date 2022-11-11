local atcmd = vim.api.nvim_create_autocmd

atcmd(
  "FileType",
  { pattern = { "python" }, command = [[nmap <F4> <Esc>:w<CR>:TermExec cmd="clear; clear; python3 %"<CR>]] }
)
atcmd(
  "FileType",
  { pattern = { "python" }, command = [[imap <F4> <Esc>:w<CR>:TermExec cmd="clear; clear; python3 %"<CR>]] }
)
atcmd(
  "FileType",
  { pattern = { "python" }, command = [[nmap <F3> <Esc>:w<CR>:TermExec cmd="clear; clear; pypy3 %"<CR>]] }
)
atcmd(
  "FileType",
  { pattern = { "python" }, command = [[imap <F3> <Esc>:w<CR>:TermExec cmd="clear; clear; pypy3 %"<CR>]] }
)

atcmd("FileType", {
  pattern = { "cpp" },
  command = [[nmap<F4> <Esc>:w<CR>:TermExec cmd="clear; clear; rm -r ./main.exe; g++ -std=c++20 -g ./*.cpp -o ./main.exe && ./main.exe"<CR>]],
})
atcmd("FileType", {
  pattern = { "cpp" },
  command = [[imap<F4> <Esc>:w<CR>:TermExec cmd="clear; clear; rm -r ./main.exe; g++ -std=c++20 -g ./*.cpp -o ./main.exe && ./main.exe"<CR>]],
})

atcmd("FileType", {
  pattern = { "cpp" },
  command = [[nmap <F3> <Esc>:w<CR>:TermExec cmd="clear; clear; rm -r main.exe; g++ -std=c++20 -g ./*.cpp -o ./main.exe -lGLU -lGL -lglut && ./main.exe"<CR>]],
})
atcmd("FileType", {
  pattern = { "cpp" },
  command = [[imap <F3> <Esc>:w<CR>:TermExec cmd="clear; clear; rm -r main.exe; g++ -std=c++20 -g ./*.cpp -o ./main.exe -lGLU -lGL -lglut && ./main.exe"<CR>]],
})

atcmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "*.ejs",
  },
  command = "set filetype=html",
})

-- Formatting Files
atcmd("BufWritePre", {
  pattern = { "*.cpp", "*.c", "*.vue", "*.lua", "*.css", "*.js", "*.html", "*.htm", "*py" },
  callback = function()
    vim.lsp.buf.format()
  end,
})
