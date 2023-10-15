-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
    pattern = '*',
})

vim.api.nvim_create_autocmd('CompleteDone', {
    callback = function()
        if vim.fn.pumvisible() == 0 then
            vim.cmd('silent! pclose')
        end
    end,
    group = vim.api.nvim_create_augroup('ClosePopUpMenu', { clear = true }),
    pattern = '*',
})
