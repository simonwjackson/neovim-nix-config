vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.lsp.start({
			name = "htmx",
			cmd = { "@htmxLsp@" },
			filetypes = { "html", "templ" },
			init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
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
