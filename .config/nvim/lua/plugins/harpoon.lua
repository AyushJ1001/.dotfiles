return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local ui = require("harpoon.ui")
        local mark = require("harpoon.mark")

        vim.keymap.set("n", "<leader>he", function() ui.toggle_quick_menu() end)
        vim.keymap.set("n", "<leader>ha", function() mark.add_file() end)

        vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<leader>hj", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<leader>hk", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<leader>hl", function() ui.nav_file(4) end)
    end
}
