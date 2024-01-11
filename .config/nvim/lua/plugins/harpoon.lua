return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED
		local wk = require("which-key")

		wk.register({
			h = {
				name = "harpoon",
				a = { function() harpoon:list():append() end, "Add Buffer" },
				e = {function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Toggle Menu"},
				-- Toggle previous & next buffers stored within Harpoon list
				p = { function() harpooon:list():prev() end, "Previous" },
				n = { function() harpooon:list():next() end, "Next" },
			}
		}, { prefix = "<leader>" })


		vim.keymap.set("n", "<C-UP>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-RIGHT>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-DOWN>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-LEFT>", function() harpoon:list():select(4) end)

	end,
}
