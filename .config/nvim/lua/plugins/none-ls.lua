return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettierd,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.diagnostics.typos,
                    null_ls.builtins.diagnostics.chktex,
                    null_ls.builtins.formatting.latexindent,
                },
            })
        end
    },
}
