return {
	-- guess the indentation setting (tab vs spaces, indation level)
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},
	-- relative line numbers in insert mode
	{
		"pjvds/dynumbers.nvim",
		event = "VeryLazy",
		config = function()
			require("dynumbers").setup()
		end,
	},
	{
		"nvim-java/nvim-java",
		lazy = false,
		dependencies = {
			"nvim-java/lua-async-await",
			"nvim-java/nvim-java-core",
			"nvim-java/nvim-java-test",
			"nvim-java/nvim-java-dap",
			"MunifTanjim/nui.nvim",
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			{
				"williamboman/mason.nvim",
				opts = {
					registries = {
						"github:nvim-java/mason-registry",
						"github:mason-org/mason-registry",
					},
				},
			},
		},
		config = function()
			require("java").setup({})
			require("lspconfig").jdtls.setup({
				on_attach = require("nvchad.configs.lspconfig").on_attach,
				capabilities = require("nvchad.configs.lspconfig").capabilities,
				filetypes = { "java" },
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		config = function()
			require("configs.conform")
		end,
	},
	-- make scrolling smooth and nice
	{
		"psliwka/vim-smoothie",
		event = "BufRead",
	},
	-- Blazing fast indentarion style detection for Neovim written in Lua.
	-- The goal of this plugin is to automatically detect the indentation
	-- style used in a buffer and updating the buffer options accordingly.
	{
		"nmac427/guess-indent.nvim",
		event = "InsertEnter",
		config = function()
			require("guess-indent").setup({
				auto_cmd = true, -- Set to false to disable automatic execution
				filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
					"netrw",
					"tutor",
				},
				buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
					"help",
					"nofile",
					"terminal",
					"prompt",
				},
			})
		end,
	},
	--
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			local t = require("telescope")
			t.load_extension("file_browser")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	-- These are some examples, uncomment them if you want to see them work!
	-- {
	--   "neovim/nvim-lspconfig",
	--   config = function()
	--     require("nvchad.configs.lspconfig").defaults()
	--     require "configs.lspconfig"
	--   end,
	-- },
	--
	-- {
	-- 	"williamboman/mason.nvim",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"lua-language-server", "stylua",
	-- 			"html-lsp", "css-lsp" , "prettier"
	-- 		},
	-- 	},
	-- },
	--
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"vim", "lua", "vimdoc",
	--      "html", "css"
	-- 		},
	-- 	},
	-- },
}