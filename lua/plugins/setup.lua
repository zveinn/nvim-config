-- Packer, manually install it:
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim \
--   ~/.config/nvim/pack/packer/start/packer.nvim
-- OR auto install packer if not installed
-- $PWD/.local/share/nvim/ + ..
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

return require("packer").startup(function()
	use "wbthomason/packer.nvim" -- https://github.com/wbthomason/packer.nvim

	-- Look and Feel
	use { "catppuccin/nvim", as = "catppuccin" } -- https://github.com/catppuccin/nvim

	-- Productivity
	use "nvim-lualine/lualine.nvim" -- https://github.com/nvim-lualine/lualine.nvim
	use {
		"nvim-tree/nvim-tree.lua",    -- https://github.com/nvim-tree/nvim-tree.lua
		requires = {
			"nvim-tree/nvim-web-devicons", -- https://github.com/nvim-tree/nvim-web-devicons
		},
	}
	use { "AndrewRadev/splitjoin.vim" }
	use {
		"nvim-telescope/telescope-fzf-native.nvim", -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
		run = "make",
	}
	use {
		"nvim-telescope/telescope.nvim", -- https://github.com/nvim-telescope/telescope.nvim
		requires = {
			"nvim-lua/plenary.nvim",
		},
		branch = "0.1.x",
	}
	use {
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require('copilot').setup({
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<C-t>"
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.7
					},
				},
				suggestion = {
					enabled = false,
					auto_trigger = true,
					debounce = 500,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = true,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					go = true,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = 'node', -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	}

	use {
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup({
				event = { "InsertEnter", "LspAttach" },
				fix_pairs = true,
			})
		end
	}

	-- Filetypes
	-- use "chrisbra/csv.vim" -- https://github.com/chrisbra/csv.vim

	-- Development
	use "lewis6991/gitsigns.nvim"      -- https://github.com/lewis6991/gitsigns.nvim
	use {
		"nvim-treesitter/nvim-treesitter", -- https://github.com/nvim-treesitter/nvim-treesitter
		run = ":TSUpdate"
	}
	-- use "nvim-treesitter/nvim-treesitter-textobjects" -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	use "rhysd/vim-clang-format" -- https://github.com/rhysd/vim-clang-format
	use "fatih/vim-go"          -- https://github.com/fatih/vim-go
	use "hrsh7th/cmp-nvim-lsp"  -- https://github.com/hrsh7th/cmp-nvim-lsp
	use "hrsh7th/nvim-cmp"      -- https://github.com/hrsh7th/nvim-cmp
	use "neovim/nvim-lspconfig" -- https://github.com/neovim/nvim-lspconfig
	use "onsails/lspkind-nvim"  -- https://github.com/onsails/lspkind-nvim
	use "onsails/lspkind-nvim"  -- https://github.com/onsails/lspkind-nvim
	-- use "williamboman/nvim-lsp-installer"     -- https://github.com/williamboman/nvim-lsp-installer
	use "numToStr/Comment.nvim" -- https://github.com/numToStr/Comment.nvim
	-- use { "kylechui/nvim-surround", tag = "*" }  -- https://github.com/kylechui/nvim-surround
	use "windwp/nvim-autopairs"
	use { "L3MON4D3/LuaSnip", requires = { "rafamadriz/friendly-snippets" } }
	use { 'saadparwaiz1/cmp_luasnip' }

	use { "williamboman/mason.nvim" }

	if packer_bootstrap then
		require("packer").sync()
	end
end)
