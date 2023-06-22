return {
    'glepnir/lspsaga.nvim',
    opts = {
        diagnostic = {
            on_insert = true,
            on_insert_follow = true,
            -- insert_winblend = 100,
            -- show_code_action = true,
            -- show_source = true,
            -- jump_num_shortcut = true,
            -- max_width = 0.7,
            -- max_height = 0.6,
            -- max_show_width = 0.9,
            -- max_show_height = 0.6,
            -- text_hl_follow = true,
            -- border_follow = true,
            -- extend_relatedInformation = false,
            -- keys = {
            --     exec_action = 'o',
            --     quit = 'q',
            --     go_action = 'g',
            --     expand_or_jump = '<CR>',
            --     quit_in_show = { 'q', '<ESC>' },
            -- },
        },
        finder = {
            keys = {
                jump_to = 'g',
                expand_or_jump = 'o',
                vsplit = 'wo',
                split = 'wu',
                tabe = 't',
                tabnew = 'r',
                quit = { 'q', '<ESC>' },
                close_in_preview = '<ESC>',
            },
        },
        definition = {
            -- keys = {
            edit = '<C-o>',
            vsplit = '<C-v>',
            split = '<C-h>',
            tabe = '<C-t>',
            quit = '<C-q>',
            close = '<Esc>',
            -- },
        },
        code_action = {
            num_shortcut = true,
            keys = {
                quit = '<C-q>',
                exec = { '<CR>', '<C-o>' },
            },
        },
        lightbulb = {
            enable = true,
            enable_in_insert = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
        },
        rename = {
            quit = '<C-q>',
            exec = '<CR>',
            mark = 'm',
            confirm = '<CR>',
            in_select = true,
        },
        outline = {
            win_position = 'left',
            win_with = '',
            win_width = 30,
            show_detail = true,
            auto_preview = true,
            auto_refresh = true,
            auto_close = true,
            custom_sort = nil,
            keys = {
                jump = 'o',
                expand_collaspe = 'u',
                quit = '<C-q>',
            },
        },
        callhierarchy = {
            show_detail = true,
            keys = {
                edit = 'e',
                vsplit = 'v',
                split = 's',
                tabe = 't',
                jump = 'o',
                quit = '<C-q>',
                expand_collaspe = 'u',
            },
        },
        symbol_in_winbar = {
            enable = false,
            separator = ' ',
            hide_keyword = true,
            show_file = true,
            folder_level = 2,
        },
        ui = {
            -- border type can be single,double,rounded,solid,shadow.
            border = 'rounded',
            -- kind = require 'catppuccin.groups.integrations.lsp_saga'.custom_kind(),
        },
    },
}