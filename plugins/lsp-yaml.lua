vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.y[a]ml",
	callback = function()
		vim.lsp.start({
			name = "yaml",
			cmd = { "@yamlLanguageServer@", "--stdio" },
			filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
			settings = {
				-- https://github.com/redhat-developer/vscode-redhat-telemetry#how-to-disable-telemetry-reporting
				redhat = { telemetry = { enabled = false } },
			},
			root_dir = vim.fs.dirname(vim.fs.find({
				".git",
			}, { upward = true })[1]),
			single_file_support = true,
			log_level = vim.lsp.protocol.MessageType.Warning,
		})
	end,
})

return {}
