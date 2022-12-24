local opt = vim.opt

opt.autoread = true
opt.number = true
opt.relativenumber = true
-- lualine did
opt.showmode = false
opt.ruler = false

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- vim.opt.smarttab = false
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.swapfile = false

opt.mouse = "a"

opt.cmdheight = 0
opt.pumheight = 10
opt.ignorecase = true
opt.smartcase = true
-- opt.hidden = true
-- opt.title = true -- for show current dir
opt.timeoutlen = 500 --default value = 1000
opt.ttimeout = true
opt.ttimeoutlen = 50 --default value = 1000
opt.hlsearch = false
-- vim.opt.paste = true

-- Cool floating window popup menu for completion on command line
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.shortmess = 'aoOTIcF'
opt.whichwrap:append("<,>,[,],h,l") -- 可以从当前行直接前往上一行


opt.cursorline       = true
-- vim.o.foldcolumn     = "1" -- '0' is not bad
vim.o.foldlevel      = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable     = true

opt.splitbelow = true
opt.splitright = true
opt.wrap = false
-- opt.autochdir     = true
opt.helplang = "cn"
opt.updatetime = 200
-- vim.opt.equalalways = false -- I don't like my windows changing all the time
opt.undofile = true
opt.undodir = vim.fn.expand('~/.vim/')

---  SETTINGS  ---
opt.spelllang:append("cjk") -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.wo.signcolumn = "yes"

vim.cmd([[set iskeyword+=-]]) -- 将word-word视为一个word, 方便daw

-----================ disabled some native =====================

local g = vim.g
-- vim.o.showmode = false
g.did_install_default_menus = 1
g.did_install_syntax_menu = 1
----============  disable end  ===========-------


-- Uncomment this if you define your own filetypes in `after/ftplugin`
-- Disable some builtin vim plugins
local disabled_built_ins = {
    "",
    "spellfile_plugin",
    "syntax_completion",
    "filetypes",
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "matchparen",
    "tar",
    "tarPlugin",
    "rrhelper",
    "shada",
    "vimball",
    "vimballPlugin",
    "tohtml",
    "tutor",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- vim.opt.formatoptions:remove("o")
-- 	- "a" -- Auto formatting is BAD.
-- 	- "t" -- Don't auto format my code. I got linters for that.
-- 	+ "c" -- In general, I like it when comments respect textwidth
-- 	+ "q" -- Allow formatting comments w/ gq
-- 	- "o" -- O and o, don't continue comments
-- 	+ "r" -- But do continue when pressing enter.
-- 	+ "n" -- Indent past the formatlistpat, not underneath it.
-- 	+ "j" -- Auto-remove comments if possible.
-- 	- "2" -- I'm not in gradeschool anymore

-- opt.list = true
-- opt.listchars = "tab:▸ " -- Show tabs as '▸   ▸   '
-- vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- vim.opt.showtabline = 2 -- for 标签页面
-- vim.opt.clipboard:append ("unnamedplus") -- 使用系统剪贴板
-- vim.opt.pumblend = 17
-- vim.opt.hidden = true -- I like having buffers stay around