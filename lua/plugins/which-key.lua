local present, wk = pcall(require, "which-key")
if not present then
	return
end

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

wk.setup({
	triggers = { "<leader>" },
})

local normal_mode_mappings = {
	e = { "Tree" },
	f = {
		name = "File",
		f = { "file" },
	},
	a = {
		name = "Actions",
	},
}

wk.register(normal_mode_mappings, opts)
