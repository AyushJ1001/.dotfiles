return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local dap = require("dap")
		local wk = require("which-key")

		require("dap-go").setup()
		require("dapui").setup()

		local dapui = require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		wk.register({
			d = {
				name = "Debug",
				t = { dap.toggle_breakpoint, "Toggle breakpoint" },
				c = { dap.continue, "Continue" },
			},
		}, { prefix = "<leader>" })
		require("mason").setup()
		require("mason-nvim-dap").setup({
			ensure_installed = { "stylua", "jq" },
			handlers = {}, -- sets up dap in the predefined manner
			automatic_installation = true,
		})
	end,
}
