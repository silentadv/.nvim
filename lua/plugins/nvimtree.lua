return {
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-tree/nvim-tree.lua',
        config = function ()
            vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>");
            vim.keymap.set("n", "<leader>tc", ":NvimTreeClose<CR>");

            require("nvim-tree").setup {
                git = {
                    ignore = false,
                }
            }
        end
    }
}
