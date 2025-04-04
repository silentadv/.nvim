return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp', {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        },

        -- example using `opts` for defining servers
        opts = {
            servers = {
                lua_ls = {},
                tsserver = {},
                clangd = {},
                ltex = {},
                zls = {}
            }
        },

        config = function(_, opts)
            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.servers) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities()
                lspconfig[server].setup(config)
            end
        end
    }
}
