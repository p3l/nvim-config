return {
    "nvimtools/none-ls.nvim",
    config = function()
        -- none-ls inherits its' variables from the abandoned null-ls
        local null_ls = require("null-ls")

        null_ls.setup({
            -- ensure_installed = { "ruff" },
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.diagnostics.ruff
            }
        })

        vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end
}
