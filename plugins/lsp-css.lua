vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.lsp.start({
			cmd = { "@cssls@", "--stdio" },
			filetypes = { "css", "scss", "less" },
			init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
			settings = {
				css = { validate = true },
				scss = { validate = true },
				less = { validate = true },
			},
			name = "css",
			root_dir = vim.fs.dirname(vim.fs.find({
				"package.json",
				".git",
			}, { upward = true })[1]),
			single_file_support = true,
			log_level = vim.lsp.protocol.MessageType.Warning,
		})
	end,
})

return {}
