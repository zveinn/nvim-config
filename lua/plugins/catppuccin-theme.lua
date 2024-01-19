local present, catppuccin = pcall(require, "catppuccin")
if not present then return end

vim.opt.termguicolors = true

catppuccin.setup {
	flavour = "macchiato",
	term_colors = false,
	background = { -- :h background
		light = "macchiato",
		dark = "macchiato",
	},
	transparent_background = false,
	no_italic = false,
	no_bold = false,
	styles = {
		comments = { "italic" },
		conditionals = { "bold" },
		loops = {},
		functions = { "bold" },
		keywords = {},
		strings = { "bold" },
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = { "bold" },
	},
	color_overrides = {
		all = {
			base = "#141414",
			-- crust = "#0F0F0F"
		},
	},
	-- integrations = {
	-- 	cmp = true,
	-- 	gitsigns = true,
	-- 	nvimtree = true,
	-- 	treesitter = true,
	-- 	notify = false,
	-- 	mini = {
	-- 		enabled = true,
	-- 		indentscope_color = "",
	-- 	},
	-- 	-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	-- },
	highlight_overrides = {
		macchiato = function(C)
			return {
				NvimTreeNormal = { bg = C.none },
				CmpBorder = { fg = C.surface2 },
				Pmenu = { bg = C.none },
				NormalFloat = { bg = C.none },
				TelescopeBorder = { link = "FloatBorder" },
				GitSignsChangeLn = { bg = C.base },
				GitSignsAddLn = { bg = C.base },
			}
		end,
	},
}

vim.cmd.colorscheme "catppuccin"
