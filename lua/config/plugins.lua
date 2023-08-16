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
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("plugins.dressing")
		end,
	},
	{ "onsails/lspkind-nvim" },

	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		config = function()
			require("plugins.trouble")
		end,
	},
	{ "nvim-lua/popup.nvim" },
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("plugins.navic")
		end,
		dependencies = "neovim/nvim-lspconfig",
	},
	{
		"pmizio/typescript-tools.nvim",
		event = { "BufReadPre", "BufNewFile" },
		ft = { "typescript", "typescriptreact" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("plugins.typescript-tools")
		end,
	},

	-- Code Folding Fun
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		end,
	},

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

	-- Misc Utils
	{
		"LudoPinelli/comment-box.nvim",
		lazy = false,
		keys = {
			{ "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", desc = "comment box" },
			{ "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", mode = "v", desc = "comment box" },
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
			},
		},
	},
	{
		"echasnovski/mini.bufremove",
		version = "*",
		config = function()
			require("mini.bufremove").setup({
				silent = true,
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"echasnovski/mini.bufremove",
		},
		version = "*",
		config = function()
			require("plugins.bufferline")
		end,
		keys = {
			{ "<Space>1", "<cmd>BufferLineGoToBuffer 1<CR>" },
			{ "<Space>2", "<cmd>BufferLineGoToBuffer 2<CR>" },
			{ "<Space>3", "<cmd>BufferLineGoToBuffer 3<CR>" },
			{ "<Space>4", "<cmd>BufferLineGoToBuffer 4<CR>" },
			{ "<Space>5", "<cmd>BufferLineGoToBuffer 5<CR>" },
			{ "<Space>6", "<cmd>BufferLineGoToBuffer 6<CR>" },
			{ "<Space>7", "<cmd>BufferLineGoToBuffer 7<CR>" },
			{ "<Space>8", "<cmd>BufferLineGoToBuffer 8<CR>" },
			{ "<Space>9", "<cmd>BufferLineGoToBuffer 9<CR>" },
			{ "<A-1>", "<cmd>BufferLineGoToBuffer 1<CR>" },
			{ "<A-2>", "<cmd>BufferLineGoToBuffer 2<CR>" },
			{ "<A-3>", "<cmd>BufferLineGoToBuffer 3<CR>" },
			{ "<A-4>", "<cmd>BufferLineGoToBuffer 4<CR>" },
			{ "<A-5>", "<cmd>BufferLineGoToBuffer 5<CR>" },
			{ "<A-6>", "<cmd>BufferLineGoToBuffer 6<CR>" },
			{ "<A-7>", "<cmd>BufferLineGoToBuffer 7<CR>" },
			{ "<A-8>", "<cmd>BufferLineGoToBuffer 8<CR>" },
			{ "<A-9>", "<cmd>BufferLineGoToBuffer 9<CR>" },
			{ "<Leader>bb", "<cmd>BufferLineMovePrev<CR>", desc = "Move back" },
			{ "<Leader>bl", "<cmd>BufferLineCloseLeft<CR>", desc = "Close Left" },
			{ "<Leader>br", "<cmd>BufferLineCloseRight<CR>", desc = "Close Right" },
			{ "<Leader>bn", "<cmd>BufferLineMoveNext<CR>", desc = "Move next" },
			{ "<Leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
			{ "<Leader>bP", "<cmd>BufferLineTogglePin<CR>", desc = "Pin/Unpin Buffer" },
			{ "<Leader>bsd", "<cmd>BufferLineSortByDirectory<CR>", desc = "Sort by directory" },
			{ "<Leader>bse", "<cmd>BufferLineSortByExtension<CR>", desc = "Sort by extension" },
			{ "<Leader>bsr", "<cmd>BufferLineSortByRelativeDirectory<CR>", desc = "Sort by relative dir" },
		},
	},

	{
		"folke/noice.nvim",
		lazy = false,
		config = function()
			require("plugins.noice")
		end,
	},
}
