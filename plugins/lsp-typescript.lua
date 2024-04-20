vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.lsp.start({
			init_options = { hostInfo = "neovim" },
			cmd = { "@typescriptLanguageServer@", "--stdio" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},

			root_dir = vim.fs.dirname(vim.fs.find({
				"tsconfig.json",
				"package.json",
				"jsconfig.json",
				".git",
			}, { upward = true })[1]),
			single_file_support = true,
			name = "typescript",
			log_level = vim.lsp.protocol.MessageType.Warning,
		})
	end,
})

return {}
