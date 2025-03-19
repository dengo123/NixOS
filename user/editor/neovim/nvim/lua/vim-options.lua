vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

-- vim tabs
vim.api.nvim_set_keymap("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":tabnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-b>", ":tabprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-w>", ":tabclose<CR>", { noremap = true, silent = true })

-- Zeilennummern anzeigen
vim.opt.number = true          -- Absolute Zeilennummern
vim.opt.relativenumber = true  -- Relative Zeilennummern

-- Hintergrund transparent machen
vim.o.termguicolors = true
vim.wo.winblend = 20
vim.o.pumblend = 20

vim.cmd("autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("autocmd ColorScheme * highlight NonText guibg=NONE ctermbg=NONE")
vim.cmd("autocmd ColorScheme * highlight LineNr guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight Folded guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight EndOfBuffer guibg=NONE")


