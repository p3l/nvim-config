return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { { "prettierd", "prettier" } },
                typescript = { { "prettierd", "prettier" } },
                json = { { "prettierd", "prettier" } },
                -- graphql = { { "prettierd", "prettier" } },
                -- java = { "google-java-format" },
                markdown = { { "prettierd", "prettier" } },
                html = { "prettierd" },
                bash = { "beautysh" },
                yaml = { "yamlfix" },
                toml = { "taplo" },
                css = { { "prettierd", "prettier" } }
            }
        })

        vim.keymap.set({ "n", "v" }, "<leader>l", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end,
        { desc = "Format file or range (in visual mode)" })
    end
}
