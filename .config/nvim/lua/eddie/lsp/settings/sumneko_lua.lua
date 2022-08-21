return {
	settings = {

		Lua = {
			diagnostics = {
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
        globals = { "vim", "pcall" },
}
