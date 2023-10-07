return{
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = { completeopt = "menu,menuone,preview,noselect", },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                 end,},

            mapping = cmp.mapping.preset.insert({
                ['<C-o>'] = cmp.mapping.complete(),
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-y>'] = cmp.mapping.confirm({ select = false}),
                ['<C-j>'] = function(fallback)
                    if luasnip.jump(1) then
                        return
                    end
                    fallback()
                end,
                ['<C-k>'] = function(fallback)
                    if luasnip.jump(-1) then
                        return
                    end
                    fallback()
                end,
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })
    end,
}
