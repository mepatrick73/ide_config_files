return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatter_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                cmake = { "cmake_format" },
                cpp = { "clang_format" },
                java = { "google-java-format" }
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            }
        })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
