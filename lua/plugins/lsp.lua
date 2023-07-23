return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ -- Optional
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.api.nvim_command, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required

		--
		{
			"jay-babu/mason-null-ls.nvim",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"williamboman/mason.nvim",
				"jose-elias-alvarez/null-ls.nvim",
			},
		},
	},
	config = function()
		local lsp = require("lsp-zero").preset({})

		lsp.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp.default_keymaps({ buffer = bufnr })
		end)

		require("lspconfig").perlnavigator.setup({
			settings = {
				perlnavigator = {
					perlPath = "carton",
					perlParams = { "exec", "perl" },
					enableWarnings = true,
					perlcriticEnabled = true,
				},
			},
		})

		lsp.format_on_save({
			format_opts = {
				async = false,
				timeout_ms = 10000,
			},
			servers = {
				["null-ls"] = { "javascript", "typescript", "lua", "css", "sql", "vue" },
				["perlnavigator"] = { "perl" },
			},
		})

		lsp.setup()

		vim.diagnostic.config({
			virtual_text = true,
		})

		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Replace these with the tools you have installed
				-- make sure the source name is supported by null-ls
				-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.perltidy,
				null_ls.builtins.formatting.stylua,
			},
		})

		require("mason-null-ls").setup({
			ensure_installed = nil,
			automatic_installation = true,
		})

		-- require('lsp-zero').setup {
		--   -- LSP Support
		--   lspconfig = require('lspconfig'),
		--   mason = require('mason-lspconfig'),
		--   -- Autocompletion
		--   cmp = require('cmp'),
		--   luasnip = require('luasnip'),
		-- }
	end,
}
