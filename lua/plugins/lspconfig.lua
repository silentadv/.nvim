return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp', {
            "folke/lazydev.nvim",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        },

        opts = {
            servers = {
                lua_ls = {},
                tsserver = {},
                clangd = {},
                nil_ls = {},
                gopls = {}
            }
        },

        config = function(_, opts)
            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.servers) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities()
                lspconfig[server].setup(config)
            end

            vim.diagnostic.config {
                virtual_text = true,
                underline = true,
                signs = true,
                severity_sort = true
            }


            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    }
}
