local keymap = vim.keymap.set
local silent = { silent = true }

keymap("n", "<leader>ff", "<CMD>lua require('plugins.telescope').project_files()<CR>")
keymap("n", "<leader><leader>", "<CMD>lua require('plugins.telescope').project_files()<CR>")

keymap("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Live Grep" })
keymap("n", "<leader>/", "<CMD>Telescope live_grep<CR>", { desc = "Live Grep" })
