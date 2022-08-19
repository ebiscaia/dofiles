-- vim.cmd "colorscheme gruvbox"

local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  vim.cmd "colorscheme darkblue"
  return
end

-- Italic fonts to comments
-- It needs to be here because it has to be run after colorscheme
--vim.highlight.create('Comment', { cterm = 'italic', gui = 'italic' }, false) -- Comments in italics
if colorscheme == "nord" then vim.api.nvim_set_hl(0, 'Comment', { fg = "#4C556A", italic = true })
elseif colorscheme == "gruvbox" then vim.api.nvim_set_hl(0, 'Comment', { fg = "#a89984", italic = true })
elseif colorscheme == "darkblue" then vim.api.nvim_set_hl(0, 'Comment', { fg = "#81a1c1", italic = true })
end
