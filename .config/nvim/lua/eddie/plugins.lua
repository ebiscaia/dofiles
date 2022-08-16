local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})




-- Install your plugins here
return packer.startup(function(use)

  -- My plugins here

  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "norcalli/nvim-colorizer.lua"
  use "nvim-lualine/lualine.nvim"

  -- Colorschemes
  use "gruvbox-community/gruvbox" -- Gruvbox colorscheme
  use "Mofiqul/dracula.nvim" -- Dracula colorscheme
  use "arcticicestudio/nord-vim" -- Nord Theme

  -- Completion plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- Buffer completions
  use "hrsh7th/cmp-path" -- Path completions
  use "hrsh7th/cmp-cmdline" -- Cmdline completions
  use "hrsh7th/cmp-nvim-lua" -- Neovim config completion
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions
  use "saadparwaiz1/cmp_luasnip" -- Snippets
  -- use "windwp/nvim-autopairs"                 -- Completion -> coded in LuaSnip
  use "jiangmiao/auto-pairs"


  -- Snippets
  use "L3MON4D3/LuaSnip" -- Snippet engine
  use "rafamadriz/friendly-snippets" -- Set of snippets

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Nvim Tree
  use "kyazdani42/nvim-tree.lua"
  use 'kyazdani42/nvim-web-devicons'

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Git
  use 'TimUntersberger/neogit'
  use 'sindrets/diffview.nvim'
  use 'lewis6991/gitsigns.nvim'
  use { 'akinsho/git-conflict.nvim', config = function()
    require('git-conflict').setup(
      {
        default_mappings = true, -- disable buffer local mapping created by this plugin
        disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
        highlights = { -- They must have background color, otherwise the default color will be used
          incoming = 'DiffText',
          current = 'DiffAdd',
        }
      }
    )
  end }

  -- Null-LS
  use "jose-elias-alvarez/null-ls.nvim"

  -- Bufferline
  use "akinsho/bufferline.nvim"

  -- DAP - Debugging
  use 'mfussenegger/nvim-dap'
  use "rcarriga/nvim-dap-ui"
  use 'nvim-telescope/telescope-dap.nvim'
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'Pocco81/DAPInstall.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
