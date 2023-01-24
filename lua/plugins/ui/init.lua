local use = require("packer").use
-- NOTE :====================== ui =====================

-- NOTE : Theme
use {
    { "rebelot/kanagawa.nvim", config = [[require 'plugins.ui.theme.kanagawa']], opt = true, },
    { "sainnhe/everforest", config = [[require 'plugins.ui.theme.everforest']], opt = true, },
    { "projekt0n/github-nvim-theme", config = [[require 'plugins.ui.theme.github']], opt = true },
    { "Mofiqul/dracula.nvim", config = [[require 'plugins.ui.theme.dracula']], opt = true },
    { "AlexvZyl/nordic.nvim", config = [[require 'plugins.ui.theme.nordic']], opt = true },
    { "catppuccin/nvim", as = "catppuccin", config = [[require 'plugins.ui.theme.catp']], opt = false }
}

use {

    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function() -- don't change this
        require('colorizer').setup {}
    end
}


use {
    { -- 状态栏
        "nvim-lualine/lualine.nvim",
        event = 'VimEnter',
        requires = { "kyazdani42/nvim-web-devicons" },
        config = [[require "plugins.ui.lualine"]],
    },
    { -- 文件树
        "nvim-tree/nvim-tree.lua",
        config = [[require "plugins.ui.nvim_tree"]],
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    },

    { -- 标签栏
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        events = 'VimEnter',
        requires = "nvim-tree/nvim-web-devicons",
        config = [[require "plugins.ui.bufferline"]],
    },
}


-- nice ui
use {
    "folke/noice.nvim",
    requires = {
        { "muniftanjim/nui.nvim", module = 'nui' },
        { "rcarriga/nvim-notify", config = [[require "plugins.ui.notify"]], module = 'notify' },
    },
    config = [[require "plugins.ui.noice"]]
}

-- smooth scroll animation
if not vim.g.neovide then
    use {
        'goolord/alpha-nvim',
        config = [[require("plugins.ui.alpha")]],
    }

    use {
        'gen740/SmoothCursor.nvim',
        config = [[require 'plugins.ui.smooth']],
        requires = {
            'declancm/cinnamon.nvim',
            'edluffy/specs.nvim',
        },
    }
end
