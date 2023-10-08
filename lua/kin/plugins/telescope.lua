-- TELESCOPE
-- This plugin will give better navigation across the filesystem such as fuzzy find string and files
return {
    'nvim-telescope/telescope.nvim',
     branch = '0.1.x',
     dependencies = {
	'nvim-lua/plenary.nvim',
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-tree/nvim-web-devicons",
     },
     config = function()
	    local telescope = require("telescope")
	    local actions = require("telescope.actions")
        local builtin = require('telescope.builtin')

	    telescope.setup({
	      defaults = {
		path_display = { "truncate " },
		mappings = {
		  n = {
		    ["q"] = actions.close, -- close telescope
		  },
		  i = {
		    ["<C-k>"] = actions.move_selection_previous, -- move to prev result
		    ["<C-j>"] = actions.move_selection_next, -- move to next result
		    ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
		  },
		},
	      },
	    })

	    telescope.load_extension("fzf")

	    -- set keymaps
	    local keymap = vim.keymap
	    keymap.set("n", "<leader>ff", builtin.find_files, {})
        keymap.set("n", "<leader>rr", builtin.live_grep, {})
	    keymap.set("n", "<leader>fr", builtin.oldfiles, {})
	    keymap.set("n", "<leader>fc", builtin.grep_string, {})
     end
}
