vim.g.mapleader = " "

require('config.lazy');
require('config.fterm');
require('config.telescope');
require('config.nvim-tree');
require('config.mason');

local opt = vim.opt;

opt.tabstop = 4;
opt.shiftwidth = 4;
opt.expandtab = true;

vim.cmd('set number');
vim.cmd('set clipboard+=unnamedplus');
vim.cmd('colorscheme retrobox');

vim.api.nvim_set_keymap('n', '<leader>fm', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
