return {
	"nvim-lualine/lualine.nvim", -- 状态栏
	event = "VimEnter",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
			},
		})
	end,
}
