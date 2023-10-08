return{
 "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
      local toggleterm = require("toggleterm")
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction="float" })


      toggleterm.setup({
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
    })

    function _LAZYGIT_TOGGLE()
        lazygit:toggle()
    end
    local keymap = vim.keymap
    keymap.set('n', '<leader>l', ':lua _LAZYGIT_TOGGLE()<cr>', {silent = true}) --Open lazygit command

  end
}
