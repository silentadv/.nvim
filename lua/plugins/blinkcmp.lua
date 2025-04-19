return {
    {
        'saghen/blink.cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
        },
        version = '*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config

        opts = {
            keymap = { preset = 'default' },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            sources = {
                default = { "lsp", 'path', 'snippets', 'buffer' }
            },

            snippets = { preset = "luasnip" },
            signature = { enabled = true },
        },
    }
}
