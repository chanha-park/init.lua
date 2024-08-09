-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
    pattern = '*',
})

-- XXX: refer https://github.com/neovim/neovim/issues/20726
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        vim.opt.foldmethod = 'manual'
    end,
    group = vim.api.nvim_create_augroup('PreventHang', { clear = true }),
    pattern = '*',
})
