-- COLORSCHEME
-- this plugin will give the colorscheme to neovim
return { 
    "bluz71/vim-nightfly-colors", 
    name = "nightfly", 
    lazy = false, 
    priority = 1000, 
    config = function() 
	    vim.cmd([[colorscheme nightfly]])
    end,
}
