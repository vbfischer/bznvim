return {
	-- UTILS
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-tree/nvim-web-devicons",
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
                alpha = true
            }
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
}
