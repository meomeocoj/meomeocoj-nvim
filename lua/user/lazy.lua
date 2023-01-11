local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	({ "wbthomason/packer.nvim" }) -- Have packer manage itself({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
		({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
		({ "numToStr/Comment.nvim" })
		({ "JoosepAlviste/nvim-ts-context-commentstring" })
		({ "kyazdani42/nvim-web-devicons" })
		({ "kyazdani42/nvim-tree.lua" })
		({ "akinsho/bufferline.nvim" })
		({ "moll/vim-bbye" })
		({ "nvim-lualine/lualine.nvim" })
		({ "akinsho/toggleterm.nvim" })
		({ "ahmedkhalf/project.nvim" })
		({ "lewis6991/impatient.nvim" })
		({ "lukas-reineke/indent-blankline.nvim" })
		({ "goolord/alpha-nvim" })
		({ "folke/which-key.nvim" })
		-- Colorschemes
		({ "folke/tokyonight.nvim" })
		({ "lunarvim/darkplus.nvim" })
		-- Cmp
		({ "hrsh7th/nvim-cmp" }) -- The completion plugin
		({ "hrsh7th/cmp-buffer" }) -- buffer completions
		({ "hrsh7th/cmp-path" }) -- path completions
		({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
		({ "hrsh7th/cmp-nvim-lsp" })
		({ "hrsh7th/cmp-nvim-lua" })
		({ "hrsh7th/cmp-nvim-lsp-signature-help" })
		({ "onsails/lspkind.nvim" })
		-- Snippets
		({ "L3MON4D3/LuaSnip" }) --snippet engine
		({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
		-- LSP
		({ "neovim/nvim-lspconfig" }) -- enable LSP
		({ "williamboman/mason.nvim" }) -- simple to use language server installer
		({ "williamboman/mason-lspconfig.nvim" })
		({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
		({ "RRethy/vim-illuminate" })
		({
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup({})
			end,
		})
		-- Telescope
		({ "nvim-telescope/telescope.nvim" })
		-- Treesitter
		({ "nvim-treesitter/nvim-treesitter" })
		-- Git
		({ "lewis6991/gitsigns.nvim" })
		--RUST
		("simrat39/rust-tools.nvim")
		({
			"saecki/crates.nvim",
			tag = "v0.3.0",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("crates").setup()
			end,
		})
		(		-- Navigator
"christoomey/vim-tmux-navigator",

	-- DAP
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		requires = "mfussenegger/nvim-dap",
		config = function()
			require("dapui").setup()
		end,
	},
})
