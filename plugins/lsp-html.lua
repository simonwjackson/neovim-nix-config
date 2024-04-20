vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.lsp.start({
			cmd = { "@htmlls@", "--stdio" },
			filetypes = { "html", "templ" },
			single_file_support = true,
			settings = {},
			init_options = {
				provideFormatter = true,
				embeddedLanguages = { css = true, javascript = true },
				configurationSection = { "html", "css", "javascript" },
			},
			name = "css",
			root_dir = vim.fs.dirname(vim.fs.find({
				"package.json",
				".git",
			}, { upward = true })[1]),
			log_level = vim.lsp.protocol.MessageType.Warning,
		})
	end,
})

return {}
