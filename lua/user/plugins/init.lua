return {
	"nvim-lua/plenary.nvim",
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	"akinsho/toggleterm.nvim",
	"ahmedkhalf/project.nvim",
	"lewis6991/impatient.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"goolord/alpha-nvim",
	"folke/which-key.nvim",

	-- Colorschemes
	"folke/tokyonight.nvim",
	"lunarvim/darkplus.nvim",

	-- Cmp
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"onsails/lspkind.nvim",
			-- Snippets
			"rafamadriz/friendly-snippets",
		},
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
		},
		config = function()
			require("fidget").setup({})
		end,
	},
	"jose-elias-alvarez/null-ls.nvim",
	"RRethy/vim-illuminate",
	-- Telescope
	"nvim-telescope/telescope.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
	},

	-- Git
	"lewis6991/gitsigns.nvim",

	--RUST
	"simrat39/rust-tools.nvim",
	{
		"saecki/crates.nvim",
		version = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup({})
		end,
	},
	-- Navigator
	"christoomey/vim-tmux-navigator",

	-- DAP
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup({})
		end,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
}
