local keymap = vim.keymap.set
local silent = { silent = true }

keymap("n", "<leader>ff", "<CMD>lua require('telescope.builtin').grep_string()<CR>")
