local icons = BzVim.icons

local git_icons = {
	added = icons.gitAdd,
	changed = icons.gitChange,
	copied = ">",
	deleted = icons.gitRemove,
	renamed = "➡",
	unmerged = "‡",
	untracked = "?",
}

require("telescope").setup({
	defaults = {
		border = true,
		multi_icon = "",
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		layout_config = {
			horizontal = {
				preview_cutoff = 120,
			},
			prompt_position = "top",
		},
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = "  ",
		color_devicons = true,
		git_icons = git_icons,
		sorting_strategy = "ascending",
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
	},
	extensions = {
		fzf = {
			override_generic_sorter = false,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

-- Implementation of custom telescope viewers/pickers

local M = {}

M.project_files = function(opts)
	opts = opts or {} -- define here if you want to define something
	local ok = pcall(require("telescope.builtin").git_files, opts)
	if not ok then
		require("telescope.builtin").find_files(opts)
	end
end

return M
