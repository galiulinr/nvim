vim.g.mapleader = ',' -- Leader key

-- Common keymaps
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('n', '<leader><Space>', ':nohlsearch<CR>', { noremap = true })
vim.keymap.set('n', 'H', 'gT', { noremap = true }) -- Переключение вкладок
vim.keymap.set('n', 'L', 'gt', { noremap = true })
vim.keymap.set('n', 'gw', ':bp|bd #<CR>', { noremap = true, silent = true })
-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.keymap.set('n', '<leader>fc', ':Telescope live_grep<CR>', { noremap = true })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
-- Zen Mode
vim.keymap.set('n', '<leader>zz', ':ZenMode<CR>', { noremap = true, silent = true })

