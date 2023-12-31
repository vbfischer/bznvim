------------------------------------------------
--                                            --
--    This is a main configuration file for    --
--                    BzVim                    --
--      Change variables which you need to    --
--                                            --
------------------------------------------------

local icons = require("utils.icons")

BzVim = {
	colorscheme = "catppuccin",
	ui = {
		float = {
			border = "rounded",
		},
	},
	plugins = {
		ai = {
			chatgpt = {
				enabled = true,
			},
			codeium = {
				enabled = true,
			},
			copilot = {
				enabled = true,
			},
			tabnine = {
				enabled = false,
			},
		},
		completion = {
			select_first_on_enter = false,
		},
	},
	icons = icons,
	lsp = {
		virtual_text = true, -- show virtual text (errors, warnings, info) inline messages
	},
}
