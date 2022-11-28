local wk = require("which-key")
local builtin = require("telescope.builtin")
wk.register({
	["<Leader>"] = {
		["t"] = {
			name = " Telescope",
			g = { builtin.registers, " 查看所有寄存器的值" },
			h = { builtin.help_tags, " 查看所有tag" },
			t = { builtin.live_grep, " 正则查找目录下的文件" },
			f = { builtin.current_buffer_fuzzy_find, " 模糊查找当前Buffer内容" },
			p = { "<cmd>Telescope packer<cr>", " 查找插件的文档[C-p]" },
			s = { builtin.spell_suggest, "益查找拼写建议" },
			r = { builtin.treesitter, " 查看treesitter提供的符号" },
			e = { builtin.diagnostics, " 查看诊断信息" },
			c = { builtin.commands, "גּ 查看命令模式下的所有命令" },
			u = { builtin.oldfiles, " 查看编辑历史[C-u]" },
			i = { builtin.jumplist, " 查看跳转历史[C-i]" },
			k = { builtin.keymaps, " 查看所有的键位映射[C-/]" },
		},
		["h"] = {
			name = " Harpoon",
			h = {
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				" 打开文件清单",
			},
			c = {
				function()
					require("harpoon.cmd-ui").toggle_quick_menu()
				end,
				" 打开命令清单",
			},
			i = {
				function()
					require("harpoon.mark").add_file()
				end,
				" 将当前文件加入清单",
			},
			j = {
				function()
					require("harpoon.ui").nav_prev()
				end,
				"ﭢ 跳转到下一个清单文件",
			},
			l = {
				function()
					require("harpoon.ui").nav_next()
				end,
				"ﭠ 跳转到上一个清单文件",
			},
			m = { "<cmd>Telescope harpoon marks<CR>", " 查看所有标记" },
		},
		["="] = { "<Plug>EasyAlign", "ﱓ 按格式对齐" },
		["R"] = { "<Plug>SnipRun", " 运行代码片段" },
		["o"] = { "<cmd>LSoutlineToggle<CR>", " 查看变量窗口" },
		["b"] = { ":BufferLinePickClose<CR>", "﫧选中一个缓冲区删除" },
		["<space>"] = { "<Plug>TranslateW", " 查看当前单词的翻译" },
		["p"] = { ":PackerSync<CR>", "מּ [同步/安装] 插件" },
		["r"] = {
			name = "凜ranger/rename",
			a = { ":FloatermNew ranger<CR>", " 新建一个终端运行ranger" },
			n = { "<cmd>Lspsaga rename<CR>", "凜重命名" },
		},
		["c"] = {
			name = " spell/code_action/cd",
			k = { ":set spell!<CR>", "暈开/关 vim自带的拼写检查" },
			a = { "<cmd>Lspsaga code_action<CR>", " 查看可以进行的代码操作" },
			d = { "<cmd>Telescope zoxide list<CR>", " 查看最近跳转" },
		},
		["d"] = {
			name = " 代码诊断",
			d = { "<cmd>Lspsaga show_line_diagnostics<CR>", " 查看当前行诊断信息" },
			c = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", " 查看光标处诊断信息" },
			j = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", " 跳转到上一个诊断信息处" },
			l = { "<cmd>Lspsaga diagnostic_jump_next<CR>", " 跳转到下一个诊断信息处" },
			m = {
				function()
					vim.diagnostic.setqflist()
				end,
				" 打开诊断列表",
			},
			e = {
				function()
					vim.diagnostic.open_float()
				end,
				" 查看详细诊断信息",
			},
		},
	},
	["w"] = {
		name = " 窗口操作",
		o = { ":vsp<CR>", " 左右分屏" },
		u = { ":sp<CR>", " 上下分屏" },
		j = { "<C-w>h", " 跳转到左边窗口" },
		l = { "<C-w>l", " 跳转到右边窗口" },
		k = { "<C-w>j", " 跳转到下方窗口" },
		i = { "<C-w>k", " 跳转到上方窗口" },
		n = { ":only<CR>", " 关闭所有窗口" },
		w = { "<cmd>NvimTreeToggle<CR>", " 触发文件树" },
		["="] = { "<C-w>=", "屢恢复原来窗口尺寸" },
		["<Down>"] = { "<C-w>J", " 窗口向下移动" },
		["<Up>"] = { "<C-w>K", " 窗口向上移动" },
		["<Left>"] = { "<C-w>H", " 窗口向左移动" },
		["<Right>"] = { "<C-w>L", " 窗口向右移动" },
	},
	["g"] = {
		name = " 跳转操作",
		h = { "<cmd>Lspsaga hover_doc<cr>", " 查看悬浮文档" },
		f = { "<cmd>Lspsaga lsp_finder<cr>", " 查看相关信息" },
		d = { "<cmd>Lspsaga peek_definition<cr>", " 查看定义" },
		D = {
			function()
				vim.lsp.buf.declaration()
			end,
			" 查看声明",
		},
		i = {
			function()
				vim.lsp.buf.implementation()
			end,
			" 查看实现",
		},
		r = {
			function()
				vim.lsp.buf.references()
			end,
			" 查看所有引用",
		},
	},
})

-- TODO:
-- wk.register({
--     <++> = <++>
-- }, {prefix = '<++>'})
-- wk.registers({
--     <++> = <++>
-- }, {prefix = '<++>'})
-- wk.registers({
--     <++> = <++>
-- }, {prefix = '<++>'})
-- wk.registers({
--     <++> = <++>
-- }, {prefix = '<++>'})
-- wk.registers({
--     <++> = <++>
-- }, {prefix = '<++>'})

wk.setup({
	{
		plugins = {
			marks = false, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 30, -- how many suggestions should be shown in the list?
			},
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			presets = {
				operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = false, -- default bindings on <c-w>
				nav = false, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		-- add operators that will trigger motion and text object completion
		-- to enable all native operators, set the preset / operators plugin above
		operators = { gc = "Comments" },
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "", -- symbol used between a key and it's label
			group = "", -- symbol prepended to a group
		},
		popup_mappings = {
			scroll_down = "<c-k>", -- binding to scroll down inside the popup
			scroll_up = "<c-i>", -- binding to scroll up inside the popup
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
			align = "left", -- align columns left, center or right
		},
		ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = true, -- show help message on the command line when the popup is visible
		show_keys = true, -- show the currently pressed key and its label as a message in the command line
		triggers = "auto", -- automatically setup triggers
		-- triggers = {"<leader>"} -- or specify a list manually
		triggers_blacklist = {
			-- list of mode / prefixes that should never be hooked by WhichKey
			-- this is mostly relevant for key maps that start with a native binding
			-- most people should not need to change this
			i = { "i", "k" },
			v = { "i", "k" },
			-- n = { "<C-w>" },
		},
		-- disable the WhichKey popup for certain buf types and file types.
		-- Disabled by deafult for Telescope
		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	},
})
