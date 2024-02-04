return {
	"nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "AckslD/swenv.nvim"
    },
	config = function()
        require('lualine').setup({
		    options = {
			    theme = 'dracula'
    		},
            --sections = {
            --    lualine_a = {
            --        'swenv',
            --        cond = function()
            --            return vim.bo.filetype == "python"
            --        end
            --    }
            --}
        })
	end
}
