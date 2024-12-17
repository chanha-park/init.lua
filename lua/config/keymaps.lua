-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- -- Remap for dealing with word wrap
-- vim.keymap.set(
--     'n',
--     'k',
--     "v:count == 0 ? 'gk' : 'k'",
--     { expr = true, silent = true }
-- )
-- vim.keymap.set(
--     'n',
--     'j',
--     "v:count == 0 ? 'gj' : 'j'",
--     { expr = true, silent = true }
-- )

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set('n', '<leader>dd', ':bn|bd #<CR>', { silent = true })

-- vim.keymap.set('n', '<leader>cd', ':lcd %:h<CR>', { silent = true })

local open_terminal_lcd = function()
    vim.cmd([[
        lcd %:p:h
        terminal
        startinsert
    ]])
end

vim.keymap.set(
    'n',
    '<leader>tt',
    open_terminal_lcd,
    { desc = 'Open terminal in the directory of current file' }
)

vim.keymap.set(
    'n',
    '<leader>O',
    vim.diagnostic.setloclist,
    { desc = '[O]pen diagnostics in location list' }
)

vim.keymap.set('n', '<A-S-h>', '<C-W><', { desc = 'Resize window Left' })
vim.keymap.set('n', '<A-S-l>', '<C-W>>', { desc = 'Resize window Right' })
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

vim.keymap.set('v', 'g"', 'c""<ESC>P', { desc = 'Surround by DoubleQuote' })
vim.keymap.set('v', "g'", "c''<ESC>P", { desc = 'Surround by SingleQuote' })
vim.keymap.set('v', 'g`', 'c``<ESC>P', { desc = 'Surround by Backtick' })
vim.keymap.set('v', 'g(', 'c()<ESC>P', { desc = 'Surround by Parenthesis' })
vim.keymap.set('v', 'g{', 'c{}<ESC>P', { desc = 'Surround by Brace' })
vim.keymap.set('v', 'g[', 'c[]<ESC>P', { desc = 'Surround by SquareBracket' })
vim.keymap.set('v', 'g<', 'c<><ESC>P', { desc = 'Surround by AngleBracket' })
vim.keymap.set(
    'n',
    'gcq',
    ':s/[<>]/"/g<CR>',
    { desc = 'Change angle bracket to double quote' }
)

vim.api.nvim_create_user_command(
    'Scrollbind',
    'windo set scrollbind!',
    { desc = 'scrollbind every window', force = false }
)

vim.keymap.set(
    'n',
    '<leader>oo',
    ':Oil<CR>',
    { desc = "open 'Oil' file browser" }
)
