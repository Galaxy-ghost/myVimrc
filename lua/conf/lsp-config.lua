local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	vim.notify("mason_null_ls error", "error")
	return
end

mason.setup({
	ui = {
		-- Whether to automatically check for new versions when opening the :Mason window.
		-- check_outdated_packages_on_open = true,

		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		-- border = "none",
		icons = {
			-- The list icon to use for installed packages.
			package_installed = "✓",
			-- The list icon to use for packages that are installing, or queued for installation.
			package_pending = "➜",
			-- The list icon to use for packages that are not installed.
			package_uninstalled = "✗",
		},

		keymaps = {
			-- Keymap to expand a package
			toggle_package_expand = "<CR>",
			-- Keymap to install the package under the current cursor position
			install_package = "<Leader>i",
			-- Keymap to reinstall/update the package under the current cursor position
			update_package = "u",
			-- Keymap to check for new version for the package under the current cursor position
			check_package_version = "c",
			-- Keymap to update all installed packages
			update_all_packages = "U",
			-- Keymap to check which installed packages are outdated
			check_outdated_packages = "C",
			-- Keymap to uninstall a package
			uninstall_package = "d",
			-- Keymap to cancel a package installation
			cancel_installation = "<C-c>",
			-- Keymap to apply language filter
			apply_language_filter = "<C-f>",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"clangd",
		"sumneko_lua",
		"gopls",
		-- "goimports",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		-- "prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"clang-format",
		"goimports",
		"clangd",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
