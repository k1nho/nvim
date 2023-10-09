return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	config = function()
		local nls = require("null-ls")
		local formatting = nls.builtins.formatting -- to setup formatters
		local diagnostics = nls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		nls.setup({
			root_dir = require("null-ls.utils").root_pattern(
				".null-ls-root",
				".neoconf.json",
				"Makefile",
				".git",
				"package.json"
			),
			sources = {
				formatting.prettier.with({
					extra_filetypes = { "vue" },
				}),
				formatting.stylua,
				formatting.black,
				formatting.goimports,
				formatting.rustfmt,
				diagnostics.golangci_lint,
				diagnostics.eslint_d.with({
					condition = function(utils)
						utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
					end,
				}),
			},
			-- format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
