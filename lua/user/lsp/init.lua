local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")

require("lspconfig").tsserver.setup({
	filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
	on_attach = require("user.lsp.handlers").on_attach,
})

require("lspconfig").tailwindcss.setup({})

require("lspconfig").emmet_ls.setup({
	capabilities = require("user.lsp.handlers").capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})
