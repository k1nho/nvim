-- KEYMAPS
vim.g.mapleader = " "
local keymap = vim.keymap

local has = function(x)
	return vim.fn.has(x) == 1
end

-- enable system clipboard to be used in Mac
local isMac = has("macunix")
if isMac then
	vim.opt.clipboard:append({ "unnamedplus" })
end

keymap.set("n", "x", '"_x') -- avoid x yank

-- center screen when going up and down
keymap.set("n", "j", "jzz")
keymap.set("n", "k", "kzz")

-- use jk instead of esc to escape insert mode
keymap.set("i", "jk", "<Esc>")
keymap.set("n", "+", "<C-a>") -- increment
keymap.set("n", "-", "<C-x>") -- decrement

keymap.set("n", "dw", 'vb"_d') -- delete a word backward
keymap.set("n", "J", "mzJ`z") -- when moving a below line upwards maintain cursor position
keymap.set("x", "<Space>p", '"_dP') -- keep previous buffer when pasting over a word
keymap.set("n", ";s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>") --quick replace word

--tabs
keymap.set("n", "te", ":tabedit<CR>", { silent = true }) --open a neovim tab
keymap.set("n", "<Tab>", ":tabn<CR>", { silent = true }) -- go to the next tab
keymap.set("n", "<S-Tab>", ":tabp<CR>", { silent = true }) -- go to the next tab

-- terminal
keymap.set("n", "ss", "<C-w>s", { silent = true }) -- split window horizontal
keymap.set("n", "sv", "<C-w>v", { silent = true }) -- split window vertical
keymap.set("n", "sx", ":close<CR>", { silent = true }) -- close the terminal

-- tab navigation (up, down, left, right)
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "s<up>", "<C-w>k")
keymap.set("", "s<down>", "<C-w>j")
keymap.set("", "s<right>", "<C-w>l")
keymap.set("", "s<left>", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")
keymap.set("", "sh", "<C-w>h")

-- tab resize (up, down, left, right)
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")

-- Vertical movement with center alignment
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzz")

-- Move when highlighted
keymap.set("v", "J", ":m '>+1<cr>gv=gv")
keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- Comment/uncomment Line command (//) (TS, JS, C++, Go)
keymap.set("v", "<leader>c", [[:s,^,//,g<CR>:noh<CR>]])
keymap.set("v", "<leader>u", [[:s,//,,g<CR>:noh<CR>]])

-- remove all spaces in all lines (AOC macro)
-- keymap.set("n", "<leader>s", ":%s/\\s\\+//g")

-- remove all occurrences of a symbol (# % ,)
keymap.set("n", "<leader>z", ":%s///gI<left><left><left><left>")

-- for neovim terminal emulator (map to regular escape to normal mode)
keymap.set("t", "<Esc>", "<C-\\><C-n>")
keymap.set("t", "jk", "<C-\\><C-n>")
