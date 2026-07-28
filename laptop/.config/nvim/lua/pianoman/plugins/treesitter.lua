return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"neovim-treesitter/treesitter-parser-registry",
		},
		config = function()
			require("pianoman.config.treesitter")
		end,
	},
}
