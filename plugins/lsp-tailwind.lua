vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.lsp.start({
			name = "bash",
			cmd = { "@tailwindLanguageServer@", "--stdio" },
			-- filetypes copied and adjusted from tailwindcss-intellisense
			filetypes = {
				-- html
				"aspnetcorerazor",
				"astro",
				"astro-markdown",
				"blade",
				"clojure",
				"django-html",
				"htmldjango",
				"edge",
				"eelixir", -- vim ft
				"elixir",
				"ejs",
				"erb",
				"eruby", -- vim ft
				"gohtml",
				"gohtmltmpl",
				"haml",
				"handlebars",
				"hbs",
				"html",
				-- 'HTML (Eex)',
				-- 'HTML (EEx)',
				"html-eex",
				"heex",
				"jade",
				"leaf",
				"liquid",
				"markdown",
				"mdx",
				"mustache",
				"njk",
				"nunjucks",
				"php",
				"razor",
				"slim",
				"twig",
				-- css
				"css",
				"less",
				"postcss",
				"sass",
				"scss",
				"stylus",
				"sugarss",
				-- js
				"javascript",
				"javascriptreact",
				"reason",
				"rescript",
				"typescript",
				"typescriptreact",
				-- mixed
				"vue",
				"svelte",
				"templ",
			},
			init_options = {
				userLanguages = {
					eelixir = "html-eex",
					eruby = "erb",
					templ = "html",
				},
			},
			settings = {
				tailwindCSS = {
					validate = true,
					lint = {
						cssConflict = "warning",
						invalidApply = "error",
						invalidScreen = "error",
						invalidVariant = "error",
						invalidConfigPath = "error",
						invalidTailwindDirective = "error",
						recommendedVariantOrder = "warning",
					},
					classAttributes = {
						"class",
						"className",
						"class:list",
						"classList",
						"ngClass",
					},
				},
			},
			root_dir = vim.fs.dirname(vim.fs.find({
				"tailwind.config.js",
				"tailwind.config.cjs",
				"tailwind.config.mjs",
				"tailwind.config.ts",
				"postcss.config.js",
				"postcss.config.cjs",
				"postcss.config.mjs",
				"postcss.config.ts",
				".git",
			}, { upward = true })[1]),
			single_file_support = true,
			log_level = vim.lsp.protocol.MessageType.Warning,
		})
	end,
})

-- local util = require 'lspconfig.util'

return {}
