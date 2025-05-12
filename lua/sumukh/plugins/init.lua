-- Bootstrap lazy.nvim if not installed
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

require("lazy").setup({
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-context",

    -- Harpoon
    "theprimeagen/harpoon",

    -- UndoTree
    "mbbill/undotree",

    -- Fugitive
    "tpope/vim-fugitive",

    -- Comment.nvim
    "numToStr/Comment.nvim",

    -- Catppuccin theme
    { "catppuccin/nvim", name = "catppuccin" },

    -- Tokyonight theme
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        config = function()
            vim.cmd("colorscheme tokyonight-night")
        end
    },

    -- Tmux Navigator
    "christoomey/vim-tmux-navigator",

    -- Friendly Snippets
    "rafamadriz/friendly-snippets",

    -- LSP Zero and dependencies
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            { "L3MON4D3/LuaSnip", version = "v2.*" },
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
        }
    },

    -- Codeium
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({})
        end
    },

    -- Refactoring
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    },

    -- nvim-surround
    {
        "kylechui/nvim-surround",
        version = "*",
        config = function()
            require("nvim-surround").setup({})
        end
    },
})
