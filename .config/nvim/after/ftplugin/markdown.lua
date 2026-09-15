-- Custom features for markdown files

-- textwidth and autoindent seem to work with vim.opt_local
vim.opt_local.textwidth = 70
vim.opt_local.autoindent = true

-- Fold variables

vim.g.markdown_folding = 1
vim.o.foldlevelstart = 1
vim.o.foldlevel = 1
