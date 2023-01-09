local ok, rt = pcall(require, "rust-tools")

if not ok then
	return
end

local ok_lsp, lsp = pcall(require, "user.lsp.handlers")
if not ok_lsp then
	return
end
local opts = {
	-- rust-tools options
	tools = {
		on_initialized = function()
			vim.cmd([[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]])
		end,
		autoSetHints = true,
		inlay_hints = {
			show_parameter_hints = true,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
	-- https://rust-analyzer.github.io/manual.html#features
	server = {
		on_attach = function(client, bufnr)
			lsp.on_attach(client, bufnr)
			vim.keymap.set("n", "K", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
		end,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					-- default: `cargo check`
					command = "clippy",
				},
				lens = {
					enable = true,
				},
			},
			capabilities = lsp.capabilities,
			inlayHints = {
				lifetimeElisionHints = {
					enable = true,
					useParameterNames = true,
				},
			},
		},
	},
}
rt.setup(opts)
