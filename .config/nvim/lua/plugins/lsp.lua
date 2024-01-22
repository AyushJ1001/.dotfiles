return {
    { "saadparwaiz1/cmp_luasnip" },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require("cmp")
            local cmp_action = lsp_zero.cmp_action()

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<TAB>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                }),
            })
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        opts = {
            setup = {
                clangd = function(_, opts)
                    opts.capabilities.offsetEncoding = { "utf-16" }
                end,
            },
        },
        config = function()
            -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
            require("neodev").setup({
                -- add any options here, or leave empty to use the default settings
            })

            -- This is where all the LSP shenanigans will live
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(_, bufnr)
                -- Function to copy the contents of one table to another
                local function copyTable(orig, newKey, newValue)
                    local copy = {}
                    for key, value in pairs(orig) do
                        copy[key] = value
                    end
                    copy[newKey] = newValue
                    return copy
                end

                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                local opts = { buffer = bufnr, remap = false }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, copyTable(opts, "desc", "Go to Definition"))
                vim.keymap.set("n", "K", vim.lsp.buf.hover, copyTable(opts, "desc", "Go to Definition"))
                vim.keymap.set("n", "ws", vim.lsp.buf.workspace_symbol, copyTable(opts, "desc", "Workspace Symbols"))
                vim.keymap.set("n", "cd", vim.diagnostic.open_float, copyTable(opts, "desc", "Code Diagnostics"))
                vim.keymap.set("n", "[d", vim.diagnostic.goto_next, copyTable(opts, "desc", "Next Diagnostic"))
                vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, copyTable(opts, "desc", "Previous Diagnostic"))
                vim.keymap.set("n", "cf", vim.lsp.buf.format, copyTable(opts, "desc", "Code Format"))
                vim.keymap.set("n", "ca", vim.lsp.buf.code_action, copyTable(opts, "desc", "Code Actions"))
                vim.keymap.set("n", "cr", vim.lsp.buf.rename, copyTable(opts, "desc", "Code Rename"))
                vim.keymap.set("n", "cR", vim.lsp.buf.references, copyTable(opts, "desc", "Code References"))
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, copyTable(opts, "desc", "Signature Help"))
            end)

            require("mason-lspconfig").setup({
                ensure_installed = { "tsserver", "lua_ls", "pyright" },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                    pyright = function()
                        local pyright_opts = {
                            exclude = { ".venv" },
                            venvPath = ".",
                            venv = ".venv",
                        }
                        require("lspconfig").pyright.setup(pyright_opts)
                    end
                },
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets", "evesdropper/luasnip-latex-snippets.nvim" },
    },
}
