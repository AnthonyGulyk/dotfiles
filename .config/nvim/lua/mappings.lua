local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- jk for exiting insert mode
keymap('i', 'jk', '<esc>', opts)

-- Copy to clipboard with Ctrl+C
vim.keymap.set('n', '<C-c>', '"+y', { noremap = true, silent = true }) -- Normal mode
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true }) -- Visual mode
vim.keymap.set('i', '<C-c>', '"+y', { noremap = true, silent = true }) -- Insert mode


-- ctrl-backspace delete previous word while in insert mode
keymap('i', '<c-bs>', '<c-w>', opts)
keymap('i', '<c-h>', '<c-w>', opts)

-- set leader to space
keymap('n', '<space>', '<nop>', opts)
vim.g.mapleader = ' '

-- toggle no highlight
keymap('n', '<leader>h', ':set hlsearch!<cr>', opts)

-- no wrap
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)
keymap('n', '0', 'g0', opts)
keymap('n', '^', 'g^', opts)
keymap('n', '$', 'g$', opts)
keymap('v', 'j', 'gj', opts)
keymap('v', 'k', 'gk', opts)
keymap('x', 'j', 'gj', opts)
keymap('x', 'k', 'gk', opts)

-- continuous indenting
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- toggle windows
keymap('n', '<leader>w', '<c-w>w', opts)

-- copy file contents to system clipboard
keymap('n', '<leader>cp', ':%y+<cr>', opts)
