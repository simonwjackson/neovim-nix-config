vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.lsp.start({
			cmd = { "@eslintls@", "--stdio" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"vue",
				"svelte",
				"astro",
			},
			init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
			settings = {
				validate = "on",
				packageManager = nil,
				useESLintClass = false,
				experimental = {
					useFlatConfig = false,
				},
				codeActionOnSave = {
					enable = false,
					mode = "all",
				},
				format = true,
				quiet = false,
				onIgnoredFiles = "off",
				rulesCustomizations = {},
				run = "onType",
				problems = {
					shortenToSingleLine = false,
				},
				-- nodePath configures the directory in which the eslint server should start its node_modules resolution.
				-- This path is relative to the workspace folder (root dir) of the server instance.
				nodePath = "",
				-- use the workspace folder location or the file location (if no workspace folder is open) as the working directory
				workingDirectory = { mode = "location" },
				codeAction = {
					disableRuleComment = {
						enable = true,
						location = "separateLine",
					},
					showDocumentation = {
						enable = true,
					},
				},
			},
			name = "eslint",
			root_dir = vim.fs.dirname(vim.fs.find({
				".eslintrc",
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.yaml",
				".eslintrc.yml",
				".eslintrc.json",
				"eslint.config.js",
				"eslint.config.mjs",
				"eslint.config.cjs",
				"eslint.config.ts",
				"eslint.config.mts",
				"eslint.config.cts",
			}, { upward = true })[1]),
			single_file_support = true,
			log_level = vim.lsp.protocol.MessageType.Warning,
		})
	end,
})

return {}
