return {
	"jpwol/thorn.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
	},
	config = function(_, opts)
		require("thorn").setup(opts)

		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				local groups = {
					"Normal",
					"NormalNC",
					"SignColumn",
					"LineNr",
					"CursorLineNr",
					"CursorLine",
					"netrwCursorLine",

					-- statusline/tabline
					"StatusLine",
					"StatusLineNC",
					"TabLine",
					"TabLineFill",
					"TabLineSel",

					-- netrw / Ex
					"Directory",
					"netrwDir",
					"netrwClassify",
					"netrwPlain",
				}

				for _, group in ipairs(groups) do
					vim.api.nvim_set_hl(0, group, { bg = "NONE" })
				end

				vim.api.nvim_set_hl(0, "Visual", {
					bg = "#818f7f",
					fg = "#473738",
				})
			end,
		})

		-- Apply immediately too (in case the colorscheme was already loaded)
		vim.api.nvim_set_hl(0, "Visual", {
			bg = "#818f7f",
			fg = "#473738",
		})
	end,
}
