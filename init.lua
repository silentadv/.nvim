require('config.lazy')
require('config.telescope');
require('config.nvim-tree');
require('config.mason');
require('config.fterm');

local opt = vim.opt;

opt.tabstop = 4;
opt.shiftwidth = 4;
opt.expandtab = true;

vim.cmd('set number');
vim.cmd('colorscheme catppuccin-mocha');
vim.cmd('set clipboard+=unnamedplus');

vim.api.nvim_set_keymap('n', '<leader>fm', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
