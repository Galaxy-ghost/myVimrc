-- packer init
vim.cmd([[packadd packer.nvim]])
local packer = require("packer")
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- for autosource the plugin configuration
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

packer.startup(function(use)
    use("wbthomason/packer.nvim")
    -- ================= my plugins here ====================
    use({
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    })
    -- fast speed
    use("lewis6991/impatient.nvim")
    use("nathom/filetype.nvim")


    -- NOTE:====================== ui =====================
    -- about theme
    use { "sainnhe/everforest", opt = true }
    use("projekt0n/github-nvim-theme")


    -- 状态栏
    use({
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            'arkav/lualine-lsp-progress'
        },
    })

    -- -- 文件树
    use({
        "nvim-tree/nvim-tree.lua",
        keys = {'n','ww'},
        config = 'require"conf.nvim_tree"',
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    })

    -- home
    use({
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- tabline
    use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

    -- smooth scroll animation
    use("declancm/cinnamon.nvim")

    -- nice ui
    use({
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "muniftanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    })

    -- lsp function parse in statusline winbar
    use({
        "smiteshp/nvim-navic",
        requires = {
            "neovim/nvim-lspconfig",
        },
    })
    use("rrethy/vim-illuminate") -- cursor-word highlighting
    use("lukas-reineke/indent-blankline.nvim")


    -- NOTE: ====================== tools =====================
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    })

    -- uesful which-key
    use("folke/which-key.nvim")

    -- markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        ft = { "markdown", "md" },
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })
    -- easy change true/false with '<leader>u'
    use {
        "nguyenvukhang/nvim-toggler",
        keys = {
            { "n", "<Leader>u" },
        },
        config = function()
            require("conf.toggle")
        end,
    }

    -- TODO: compare this with toggleterm
    use("voldikss/vim-floaterm") -- float terminal
    use("mfussenegger/nvim-treehopper") -- smart range switching with 'm'
    use("junegunn/vim-easy-align") -- TODO: read official readme for better use this powerful align helper: this can help markdown auto-align with table
    use("numtostr/comment.nvim") -- powerful comment with gc<char> | gb<char> | <leader>a
    use("nvim-treesitter/nvim-treesitter-textobjects") -- easymotion with text

    -- lazy-load translate plugin
    use({
        "sicong-li/T.vim",
        keys = {
            { 'v', 'mm' },
            { 'n', 'mm' },
        },
        config = function()
            vim.keymap.set("v", "mm", ':<c-u>call T#VisualSearch(visualmode())<cr>')
            vim.keymap.set("n", "mm", "<cmd>call T#Main(expand('<cword>'))<cr>")
        end
    })


    -- Auto pairs
    -- TODO:config autopair
    use {
        "windwp/nvim-autopairs",
    }

    -- combine auto-session with telescope
    use({
        "rmagatti/session-lens",
        requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    })

    -- integrate with git
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- optional but strongly recommended
    use({
        "phaazon/hop.nvim",
        branch = "v2",
    })

    use {
        'AckslD/nvim-trevJ.lua',
        keys = { {
            "n",
            "<leader>ff",
        } },
        config = function()
            local m = require('trevj')
            m.setup {}
            vim.keymap.set('n', '<leader>ff', m.format_at_cursor)
        end, -- optional call for configurating non-default filetypes etc
    }

    use { -- foucs mode
        'junegunn/limelight.vim',
        keys = {'n', '<leader><leader>h'},
            config = 'require("conf.zen")'
    }



    -- NOTE: ====================== syntax =====================
    -- high-performance language parser
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        requires = { "p00f/nvim-ts-rainbow" }, -- rainbow pairs
    })


    -- make neovim has modernize folder
    use({
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async",
    })
    -- -- ====================== completion =====================
    -- mason | lspconfig | mason-lspconfig
    use({
        "williamboman/mason.nvim", -- lsp manager
        "williamboman/mason-lspconfig.nvim", -- make bridge between lspconfig and mason
        "neovim/nvim-lspconfig", -- official lspconfig
        "glepnir/lspsaga.nvim", -- pretty ui for [code-action | hover-text | ....]
    })

    -- NOTE: a super powerful completion engine for neovim
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
            { "tzachar/cmp-tabnine", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
            { "hrsh7th/cmp-path", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
            { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
            { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
            {
                "l3mon4d3/luasnip",
                requires = {
                    "rafamadriz/friendly-snippets"
                },
                config = function()
                    require('snips').setup()
                end
            },
        },
        event = { "cmdlineenter", "insertenter" }, -- lazy-load
        config = function()
            require("conf.cmp")
        end,
    })

    -- -- telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" }, -- lib
            { "nvim-telescope/telescope-project.nvim" },
            { "jvgrootveld/telescope-zoxide" }, -- powerful cd
            { "brandoncc/telescope-harpoon.nvim" }, -- list
            {
                "ThePrimeagen/refactoring.nvim",
                ft = { "go", "cpp", "c", "python", "lua", },
                config = function()
                    require('conf.refactor')
                end
            }, -- list
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- fuzzy finder
        },
    })
    use {
        "AckslD/nvim-neoclip.lua",
        config = function()
            require("neoclip").setup()
        end,
    }


    -- harpoon | firenvim
    use({ "theprimeagen/harpoon" })
    use({
        "glacambre/firenvim",
        run = function()
            vim.fn["firenvim#install"](0)
        end,
    })

    -- automatically set up your configuration after cloning packer.nvim
    -- put this at the end after all plugins
end)
