return {
  settings = {

    Lua = {
      diagnostics = {
        globals = { "vim", "pcall" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}
