pcall(require, 'impatient')
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
   packer_bootstrap = vim.fn.system {
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path,
   }
   vim.api.nvim_command 'packadd packer.nvim'
end

require 'options'
require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'
   use 'lewis6991/impatient.nvim'
   use 'nvim-lua/popup.nvim'
   use 'nvim-lua/plenary.nvim'

   require 'plugins/eye-candy'
   require 'plugins/main'
   require 'plugins/lsp'
   require 'plugins/ts'
   require 'plugins/tele'
   require 'plugins/cmp'

   if packer_bootstrap then
      require('packer').sync()
   end
end)
