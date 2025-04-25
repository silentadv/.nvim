return {
    { "rose-pine/neovim",         name = "rose-pine" },
    { "tiesen243/vercel.nvim" },
    { 'datsfilipe/min-theme.nvim' },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('nordic').load()
        end
    }
}
