return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            cpp = { "clangtidy" },
            java = { "checkstyle" },
            python = { "pylint" },
            cmake = { "cmakelint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
            pattern = { "*.cpp", "*.h", "*.hpp", "*.py", "*.java", "CMakeLists.txt" },
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end
        })
        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end)
    end,
}
