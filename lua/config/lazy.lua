-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    'silentadv/fterm.nvim',
    { 'wakatime/vim-wakatime', lazy = false },
    'rebelot/kanagawa.nvim',
    'nvim-lua/plenary.nvim',
    {
     'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim',
    'mikelue/vim-maven-plugin',
    'BurntSushi/ripgrep',
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
      'saghen/blink.cmp',
      dependencies = 'rafamadriz/friendly-snippets',
      version = '*',

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config

      opts = {
        keymap = { preset = 'default' },

        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = 'mono'
        },

        signature = { enabled = true }
      },
    },
    {
      'neovim/nvim-lspconfig',
      dependencies = { 'saghen/blink.cmp',  {
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
          tsserver = {}
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
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
