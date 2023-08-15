return {
	-- UTILS
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-tree/nvim-web-devicons",
		config = true,
	},

	{
		"max397574/better-escape.nvim",
		lazy = false,
		opts = {
			mapping = { "jk", "jj" },
		},
		config = true,
	},

	-- THEME
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		priority = 1000,
		opts = {
			flavour = "frappe",
			integrations = {
				alpha = true,
				telescope = {
					enabled = true,
				},
			},
		},
	},

	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.alpha")
		end,
	},

	-- Useful plugin to show you pending keybinds.
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("plugins.which-key")
		end,
	},

	-- Treesitter!
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPre",
		dependencies = {
			"hiphish/rainbow-delimiters.nvim",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
		},
		config = function()
			require("plugins.treesitter")
		end,
	},

	-- Navigating Stuff
	{
		"nvim-pack/nvim-spectre",
		lazy = true,
		keys = {
			{
				"<Leader>pr",
				"<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
				desc = "refactor",
			},
			{
				"<Leader>pr",
				"<cmd>lua require('spectre').open_visual()<CR>",
				mode = "v",
				desc = "refactor",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "cljoly/telescope-repo.nvim" },
		},
		config = function()
			require("plugins.telescope")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<C-e>", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>", desc = "NvimTree" },
		},
		config = function()
			require("plugins.tree")
		end,
	},

	-- LSP Core
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		servers = nil,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = {
			{ "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
		},
	},

	-- LSP CMP
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-calc",
			"saadparwaiz1/cmp_luasnip",
			{ "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
			{
				"David-Kunz/cmp-npm",
				config = function()
					require("plugins.cmp-npm")
				end,
			},
			{
				"zbirenbaum/copilot-cmp",
				cond = BzVim.plugins.ai.copilot.enabled,
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
		config = function()
			require("plugins.cmp")
		end,
	},

	-- LSP Addons
	{ "onsails/lspkind-nvim" },

	-- AI
	{
		"jcdickinson/codeium.nvim",
		cond = BzVim.plugins.ai.codeium.enabled,
		event = "InsertEnter",
		cmd = "Codeium",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = true,
	},
	{
		"zbirenbaum/copilot.lua",
		cond = BzVim.plugins.ai.copilot.enabled,
		event = "InsertEnter",
		config = function()
			require("plugins.copilot")
		end,
	},
}
