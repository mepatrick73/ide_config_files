return { --lazy.nvim config
    "rohit-kumar-j/cmake-tools.nvim",
    branch = "master",
    config = function()
        require("cmake-tools").setup({
            cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
        })
    end
}

