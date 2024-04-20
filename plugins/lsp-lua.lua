vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*.lua",
	callback = function()
		vim.lsp.start({
			name = "lua",
			cmd = { "@luaLanguageServer@" },
			filetypes = { "lua" },
			root_dir = vim.fs.dirname(vim.fs.find({
				".luarc.json",
				".luarc.jsonc",
				".luacheckrc",
				".stylua.toml",
				"stylua.toml",
				"selene.toml",
				"selene.yml",
			}, { upward = true })[1]),
			single_file_support = true,
			log_level = vim.lsp.protocol.MessageType.Warning,
		})
	end,
})

return {}
