local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  compile_path = vim.fn.stdpath('config').."/lua/packer_compiled.lua",
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Basic
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "lewis6991/impatient.nvim"
  use "folke/which-key.nvim"

  -- Buffer handling
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Status line
  use "nvim-lualine/lualine.nvim"

  -- File navigation
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Markdown preview
  use {"iamcco/markdown-preview.nvim", run = "cd app && npm install", cmd = "MarkdownPreview"}

  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "dracula/vim"
  use "real-99/onedarker.nvim"

  -- Dashboard
  use "goolord/alpha-nvim"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "antoinemadec/FixCursorHold.nvim" -- Needed to fix lsp doc highlight

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- lsp installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "ahmedkhalf/project.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git integration
  use {
  "lewis6991/gitsigns.nvim",
  requires = {
    "nvim-lua/plenary.nvim"
  },
  tag = "release" -- To use the latest release
}

  -- Legacy
  use "tpope/vim-surround"
  use "tpope/vim-commentary"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
