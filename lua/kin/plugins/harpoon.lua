-- HARPOON
-- Lightning fast file navigation, better when having to work on 1,2,3 files
return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap
    keymap.set('n', '<leader>q', ':lua require("harpoon.ui").toggle_quick_menu()<cr>')
    keymap.set('n', '<leader>w', ':lua require("harpoon.mark").add_file()<cr>')
    keymap.set('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<cr>')
    keymap.set('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2)<cr>')
    keymap.set('n', '<leader>3', ':lua require("harpoon.ui").nav_file(3)<cr>')
    keymap.set('n', '<leader>4', ':lua require("harpoon.ui").nav_file(4)<cr>')
    keymap.set('n', '<leader>5', ':lua require("harpoon.ui").nav_file(5)<cr>')
    keymap.set('n', '<leader>6', ':lua require("harpoon.ui").nav_file(6)<cr>')
    keymap.set('n', '<leader>7', ':lua require("harpoon.ui").nav_file(7)<cr>')
    keymap.set('n', '<leader>8', ':lua require("harpoon.ui").nav_file(8)<cr>')
    keymap.set('n', '<leader>9', ':lua require("harpoon.ui").nav_file(9)<cr>')

  end,
}
