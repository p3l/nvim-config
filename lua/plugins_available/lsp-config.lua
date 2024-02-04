return {
    {
        "williamboman/mason.nvim",
        -- lazy = false,
        config = function()
            require("mason").setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "ocamllsp",
                    "tsserver"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        -- lazy = false,
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            local lspconfig = require("lspconfig")
            -- LSP Servers
            lspconfig.lua_ls.setup({
                settings = { Lua = {diagnostics = {globals = { "vim"}}}}
            })
            lspconfig.ocamllsp.setup({})
            lspconfig.pyright.setup({
                --on_attach = function()
                    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
                --end,
                capabilities = capabilities
            })
            lspconfig.tsserver.setup({})

            -- Keymaps
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
            vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer=0})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=0})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {buffer=0})
            vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, {buffer=0})
            vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, {buffer=0})
            vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', {buffer=0})
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer=0})
        end
    }
}
