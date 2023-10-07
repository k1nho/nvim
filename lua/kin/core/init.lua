-- BASE
vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true                                  -- Enable line numbers

vim.opt.title = true
vim.opt.autoindent = true                             -- Enable auto indent 
vim.opt.smartindent = true                            -- Enable smart indent
vim.opt.backup = false                                -- Backup file creation
vim.opt.showcmd = true                                -- Show partial command in the last line of the screen
vim.opt.cmdheight = 1                                 -- Command line spacing
vim.opt.laststatus = 2                                -- Status line for the last window always
vim.opt.expandtab = true                              -- Allow tabs to space conversion
vim.opt.scrolloff = 10                                -- Minimum number of screen lines to keep above and below the cursor
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true                             -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true                               -- Enable smart tab
vim.opt.breakindent = true
vim.opt.shiftwidth = 4                                -- Number of spaces to be inserted for each indent
vim.opt.relativenumber = true                         -- Show line numbers relative to line cursor
vim.opt.tabstop = 4                                   -- Spaces to insert for a tab
vim.opt.wrap = false                                  -- No wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }      -- allow backspacing over autoindent, over line breaks and over start insert
vim.opt.path:append { '**' }                          -- Finding files - search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }      -- Ignore node_modules
vim.opt.mouse = 'a'                                   -- Enable mouse (xD)
vim.opt.hlsearch = false                              -- Do not allow terms to be highlighted after search   
vim.opt.incsearch = true                              -- Allow terms to incrementally be highlighted when searching
vim.opt.spelllang = 'en_us'                           -- Spelling language
vim.opt.spell = true                                  -- Enable spelling
-- vim.opt.shell = 'bash'                                -- Shell to be used for commands

-- KEYMAPS
vim.g.mapleader = " "
local keymap = vim.keymap

local has = function(x)
	return vim.fn.has(x) == 1
end

-- enable system clipboard to be used
local isMac = has "macunix"
if isMac then
	vim.opt.clipboard:append{'unnamedplus'}
end

keymap.set('n', 'x', '"_x') -- avoid x yank

-- center screen when going up and down
keymap.set('n', 'j', 'jzz')
keymap.set('n', 'k', 'kzz')

-- use jk instead of esc to escape insert mode
keymap.set('i', 'jk', '<Esc>')
keymap.set('n', '+', '<C-a>') -- increment
keymap.set('n', '-', '<C-x>') -- decrement

keymap.set('n', 'dw', 'vb"_d') -- delete a word backward
keymap.set('n', 'J', "mzJ`z") -- when moving a below line upwards maintain cursor position
keymap.set('x', '<Space>p', "\"_dP") -- keep previous buffer when pasting over a word
keymap.set('n', ";s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>") --quick replace word

--tabs
keymap.set('n', 'te', ':tabedit<Return>', { silent = true }) --open a neovim tab

-- terminal
keymap.set('n', 'ss', ':silent !tmux split-window -v -c "$(pwd)" "zsh"<CR>', { silent = true }) -- split window horizontal
keymap.set('n', 'sv', ':silent !tmux split-window -h -c "$(pwd)" "zsh"<CR>', { silent = true }) -- split window vertical
keymap.set('n', 'ff', ':silent !tmux resize-pane -Z<CR>', {silent=true}) --go full screen on current panilent !tmux resize-pane -Z
keymap.set('n', 'sx', ':close<CR>', {silent = true}) -- close the terminal

-- tab navigation (up, down, left, right)
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', ':silent !tmux select-pane -R<CR>')
keymap.set('', 'sh', '<C-w>h')

-- tab resize (up, down, left, right)
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')

-- Vertical movement with center alignment
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzz')

-- Move when highlighted
keymap.set('v', 'J', ":m '>+1<cr>gv=gv")
keymap.set('v', 'K', ":m '<-2<cr>gv=gv")

-- Comment/uncomment Line command (//) (TS, JS, C++, Go)
keymap.set('x', '<space>c', [[:s,^,//,g<CR>:noh<CR>]])
keymap.set('x', '<space>u', [[:s,//,,g<CR>:noh<CR>]])

keymap.set('n', '<space>l', ':lua _LAZYGIT_TOGGLE()<cr>', {silent = true}) --Open lazygit command


