require("bowsr")
require("bowsr.set")

-- install lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- install packages
require("lazy").setup({
    "folke/tokyonight.nvim",
    --
    "nvim-lua/plenary.nvim",
    -- fuzzy search
    "nvim-telescope/telescope.nvim", branch = '0.1.x',
    -- theme
    {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function() 
		vim.cmd("colorscheme rose-pine")
	end
    },
    {
        "nvim-treesitter/nvim-treesitter", 
	build = ":TSUpdate",
    },
    {
    	"nvim-treesitter/playground",
    },
    {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
	"mbbill/undotree",
    },
    {
	"tpope/vim-fugitive",
    },
    -- Uncomment the two plugins below if you want to manage the language servers from neovim
    -- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},
    {'saadparwaiz1/cmp_luasnip'},

    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
		{'lewis6991/gitsigns.nvim'},
		{'nvim-treesitter/nvim-treesitter-context'},
		{'m4xshen/autoclose.nvim'},

		--formatter
		{
			'stevearc/conform.nvim', opts = {},
		},
})

