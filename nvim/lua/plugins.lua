return {
	-- blink
	{
		'saghen/blink.cmp',
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',
		opts = {
			keymap = { preset = 'default' },
			appearance = {
				nerd_font_variant = 'mono'
			},
			completion = { documentation = { auto_show = false } },
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" }
		},
		opts_extend = { "sources.default" }
	},

	-- colorscheme switcher
	{
		"zaldih/themery.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			themes = {"evergarden", "tokyonight", "retrobox" }, -- Your list of installed colorschemes.
			livePreview = true,
		},
	},

	-- colorscheme evergarden
	{
		'everviolet/nvim', name = 'evergarden',
		priority = 1000,
		lazy = false,
		opts = {
			theme = { variant = 'fall', accent = 'blue' },
			editor = {
				transparent_background = false,
				sign = { color = 'none' },
				float = { color = 'mantle', invert_border = false },
				completion = { color = 'surface0' },
			},
		},
	},

	-- colorscheme tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	-- markdown
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		opts = {
			code = {
				position = 'left',
				language_border = '█',
				border = 'thick',
				width = 'full',
			}

		},
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate"
	},

	-- lualine
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup{
				options = { 
					theme = "palenight",
					section_separators = { left = '', right = ''},
					component_separators = { left = '|', right = '|'},
				},
				sections = {
					lualine_c = {
						{ 'filename', path = 3 },
					},
					lualine_x = {'fileformat', 'filetype'},
				},
			}
		end
	},

	-- flash
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},

	-- dashboard
	{
		"goolord/alpha-nvim",
		-- dependencies = { 'echasnovski/mini.icons' },
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			local startify = require("alpha.themes.startify")
			startify.file_icons.provider = "devicons"
			require("alpha").setup(
				startify.config
			)
		end,
	},

	--neorg
	{
		"nvim-neorg/neorg",
		lazy = false,
		version = "*",
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								note = "~/notes",
								test = "~/test",
							},
							default_workspace = "note",
						},
					},
				},
			}

			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end
	},

}
