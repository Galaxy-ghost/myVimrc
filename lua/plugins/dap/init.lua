return {
    'mfussenegger/nvim-dap',
    dependencies = {
        { 'rcarriga/nvim-dap-ui', config = true },
        { 'theHamsta/nvim-dap-virtual-text', config = { commented = true } },
        { 'jayp0521/mason-nvim-dap.nvim', config = true },
        {
            'jbyuki/one-small-step-for-vimkind',
            config = function()
                local dap = require("dap")
                dap.configurations.lua = {
                    {
                        type = 'nlua',
                        request = 'attach',
                        name = "Attach to running Neovim instance",
                    }
                }

                dap.adapters.nlua = function(callback, config)
                    callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 21231 })
                end
            end,
            dependencies = { 'nvim-dap' },
        },
    },
    config = function()
        local fn = vim.fn
        local dap_breakpoint = {
            error = {
                text = "🛑",
                texthl = "LspDiagnosticsSignError",
                linehl = "",
                numhl = "",
            },
            rejected = {
                text = "",
                texthl = "LspDiagnosticsSignHint",
                linehl = "",
                numhl = "",
            },
            stopped = {
                text = "⭐️",
                texthl = "LspDiagnosticsSignInformation",
                linehl = "DiagnosticUnderlineInfo",
                numhl = "LspDiagnosticsSignInformation",
            },
        }

        fn.sign_define("DapBreakpoint", dap_breakpoint.error)
        fn.sign_define("DapStopped", dap_breakpoint.stopped)
        fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

        local dap, dapui = require "dap", require "dapui"
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end,

    keys = {
        { "<leader><leader>e", function()
            require('osv').run_this()
        end, desc = "Begin" },

        { '<leader>ee', '<Cmd>DapToggleBreakpoint<CR>', desc = "Toggle Breakpoint" },
        { '<C-k>', '<Cmd>DapStepInto<CR>', desc = "Step Into" },
        { '<leader>eo', '<Cmd>DapStepOut<CR>', desc = "Step Out" },
        { '<leader>eO', '<Cmd>DapStepOver<CR>', desc = "Step Over" },
        { '<leader>er', '<Cmd>DapToggleRepl<CR>', desc = "Toggle Repl" },
        { '<leader>et', '<Cmd>DapTerminate<CR>', desc = "Terminate" },

        { "<C-i>", function()
            require('dap').step_back()
        end, desc = "Step Back" },

        { "<leader>eh", function()
            require('dap').run_to_cursor()
        end, desc = "Run to Cursor" },

        { "<leader>eq", function()
            require('dap').close()
        end, desc = "Quit" },

        { "<leader>eg", function()
            require("dap").session()
        end, desc = "Get Session" },

        { "<leader>ec", function()
            require("dap").continue()
        end, desc = "Continue" },

        { "<leader>ep", function()
            require("dap").pause.toggle()
        end, desc = "Pause" },

        { "<leader>eh", function()
            require('dap.ui.widgets').hover()
        end, desc = "Hover" },

        { "<leader>eu", function()
            require('dap.ui.widgets').preview()
        end, desc = "Preview" },
    },
}
