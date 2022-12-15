local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
-- Set header
local header = {
	{
		"                                             ",
		" ███████╗ ██████╗ ██████╗  █████╗ ███╗   ██╗ ",
		" ╚══███╔╝██╔═══██╗██╔══██╗██╔══██╗████╗  ██║ ",
		"   ███╔╝ ██║   ██║██████╔╝███████║██╔██╗ ██║ ",
		"  ███╔╝  ██║   ██║██╔══██╗██╔══██║██║╚██╗██║ ",
		" ███████╗╚██████╔╝██║  ██║██║  ██║██║ ╚████║ ",
		" ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ",
		"                                             ",
	},
	{
		"    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄ ",
		"    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄ ",
		"   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ",
		"   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ",
		"  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰ ",
		"  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤ ",
		" ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗ ",
		" ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟  ",
		" ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃  ",
		" ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃  ",
		"  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃   ",
		"   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁    ",
		"     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁      ",
		"        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ",
		" ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ",
	},
}
dashboard.section.header.val = header[2]

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("e", "📄  > New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("a", "🌆  > Into Ranger", "<cmd>FloatermNew ranger<CR>"),
	dashboard.button("t", "📋  > Find Text", ":Telescope live_grep<CR>"),
	dashboard.button("p", "🌳  > Find Project", ":Telescope project<CR>"),
	dashboard.button("f", "🎑  > Find File", ":Telescope find_files<CR>"),
	dashboard.button("r", "🥂  > Recent File", ":Telescope oldfiles<CR>"),
	dashboard.button("s", "💻  > Current Dir Session", "<cmd>RestoreSession<CR>"),
	dashboard.button("q", "🏓  > Quit", ":qa<CR>"),
}

dashboard.section.footer.val = {
	"               ",
	" Talk is cheap ",
	"Show me the code",
	"       🚀      ",
	"               ",
}
-- Send config to alpha
alpha.setup(dashboard.opts)
