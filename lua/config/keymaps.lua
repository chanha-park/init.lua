-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set(
    'n',
    'k',
    "v:count == 0 ? 'gk' : 'k'",
    { expr = true, silent = true }
)
vim.keymap.set(
    'n',
    'j',
    "v:count == 0 ? 'gj' : 'j'",
    { expr = true, silent = true }
)

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set('n', '<leader>dd', ':b#|bd #<CR>', { silent = true })

vim.keymap.set('n', '<leader>cd', ':lcd %:h<CR>', { silent = true })

local open_terminal_split = function()
    vim.cmd([[
        vs
        lcd %:p:h
        wincmd l
        terminal
    ]])
end

vim.keymap.set(
    'n',
    '<leader>tt',
    open_terminal_split,
    { desc = 'Open terminal in a split view' }
)

vim.keymap.set(
    'n',
    '<leader>O',
    vim.diagnostic.setloclist,
    { desc = '[O]pen diagnostics in location list' }
)

vim.keymap.set('n', '<A-S-h>', '<C-W>>', { desc = 'Resize window Left' })
vim.keymap.set('n', '<A-S-l>', '<C-W><', { desc = 'Resize window Right' })
vim.keymap.set('n', '<A-S-k>', '<C-W>+', { desc = 'Resize window Up' })
vim.keymap.set('n', '<A-S-j>', '<C-W>-', { desc = 'Resize window Down' })

vim.keymap.set(
    'n',
    '<A-S-o>',
    ':tab split<CR>',
    { desc = 'Open current buffer in a new tab' }
)

vim.keymap.set(
    { 'n', 'i' },
    '<MiddleMouse>',
    '<Nop>',
    { desc = 'Disable Middle Mouse Paste' }
)

vim.keymap.set('v', 'g"', 'c""<ESC>P', { desc = 'Surround Double Quote' })
vim.keymap.set('v', "g'", "c''<ESC>P", { desc = 'Surround Single Quote' })
vim.keymap.set('v', 'g`', 'c``<ESC>P', { desc = 'Surround Backtick' })

vim.api.nvim_create_user_command(
    'Scrollbind',
    'windo set scrollbind!',
    { desc = 'scrollbind every window', force = false }
)

vim.keymap.set({ 'i', 's' }, '<A-i>', function()
    if vim.snippet.active({ direction = 1 }) then
        return '<cmd>lua vim.snippet.jump(1)<CR>'
    else
        return '<A-i>'
    end
end, { expr = true })

vim.keymap.set({ 'i', 's' }, '<A-S-i>', function()
    if vim.snippet.active({ direction = -1 }) then
        return '<cmd>lua vim.snippet.jump(-1)<CR>'
    else
        return '<A-S-i>'
    end
end, { expr = true })

vim.keymap.set(
    'n',
    '<leader>oo',
    ':Oil<CR>',
    { desc = "open 'Oil' file browser" }
)
