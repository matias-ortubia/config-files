-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    
    -- Colorschemes
    use('rose-pine/neovim')
    use('rebelot/kanagawa.nvim')
    use('tiagovla/tokyodark.nvim')
    use('DanielEliasib/sweet-fusion')
    use('DeviusVim/deviuspro.nvim')
    use('luisiacc/gruvbox-baby')
    vim.g.gruvbox_baby_background_color = "dark"
    vim.g.gruvbox_baby_function_style = "NONE"
    use { "catppuccin/nvim", as = "catppuccin" }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use({"stevearc/oil.nvim", config = function() require("oil").setup() end,})
    use('mfussenegger/nvim-dap') -- Debugger
    
    -- LSP config
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'neovim/nvim-lspconfig'},

            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lua'},
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'}
        }
    }
end)
