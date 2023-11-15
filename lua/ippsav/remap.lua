vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Tabs creation/navigation
vim.api.nvim_set_keymap('n', '<Leader>tt', ':tabnew<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tc', ':tabclose<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t<number>', ':tabn <number><CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tn', ':tabnext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tp', ':tabprevious<CR>', { silent = true })

-- Clipboard
vim.api.nvim_set_keymap('v', 'Y', '"+y', { silent = true, noremap=true })
vim.api.nvim_set_keymap('n', 'P', '"+p', { silent = true, noremap=true })

