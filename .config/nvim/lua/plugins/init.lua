return {
	{
		"folke/neodev.nvim",
		priority = 100,
		config = function()
			require("neodev").setup({})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			local wk = require("which-key")
			wk.register({}, {})
		end,
	},
	-- nvim v0.8.0
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.keymap.set("n", "gs", ":LazyGit\n", { desc = "Git Status" })
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", ":UndotreeToggle\n", { desc = "Undotree" })
		end,
	},
	{
		"j-hui/fidget.nvim",
		tag = "v1.0.0",
		opts = {
			-- options
		},
	},
	{ "evesdropper/luasnip-latex-snippets.nvim" },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			require("todo-comments").setup({
				highlight = {
					pattern = [[.*<(KEYWORDS)\s*\d+\s*:]],
				},
			})
		end,
	},
	{ "echasnovski/mini.nvim", version = false,
        config = function ()
            require("mini.ai").setup({})
            require("mini.surround").setup({})
            require("mini.pairs").setup({})
            require("mini.fuzzy").setup({})
            require("mini.align").setup({})
        end
    },
	-- these plugins are all really cool and you should totally check them out :)
}
