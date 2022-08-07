-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "auto-pairs")
if not status_ok then
  return
end

npairs.setup {
}
