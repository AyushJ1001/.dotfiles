return {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find Git" })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Helptags" })	
	end,
}
