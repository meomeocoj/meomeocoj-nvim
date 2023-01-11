local ok, rt = pcall(require, "rust-tools")

if not ok then
	return
end

local ok_lsp, lsp = pcall(require, "user.lsp.handlers")
if not ok_lsp then
	return
end

local dap_ok, dap = pcall(require, "dap")

if not dap_ok then
	return
end

local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")

local codelldb_adapter = {
	type = "server",
	port = "${port}",
	executable = {
		command = mason_path .. "bin/codelldb",
		args = { "--port", "${port}" },
		-- On windows you may have to uncomment this:
		-- detached = false,
	},
}

local opts = {
	-- rust-tools options
	tools = {
		executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
		reload_workspace_from_cargo_toml = true,
		runnables = {
			use_telescope = true,
		},
		on_initialized = function()
			vim.cmd([[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]])
		end,
		autoSetHints = true,
		inlay_hints = {
			auto = true,
			only_current_line = false,
			parameter_hints_prefix = ":",
			other_hints_prefix = ":",
			max_len_align = false,
			max_len_align_padding = 1,
			right_align = false,
			right_align_padding = 7,
			highlight = "Comment",
			show_parameter_hints = true,
		},
	},
	dap = {
		adapter = codelldb_adapter,
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
dap.adapters.codelldb = codelldb_adapter
dap.configurations.rust = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}
