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

-- Diagnostic keymaps
vim.keymap.set(
    'n',
    '[d',
    vim.diagnostic.goto_prev,
    { desc = 'Go to previous diagnostic message' }
)
vim.keymap.set(
    'n',
    ']d',
    vim.diagnostic.goto_next,
    { desc = 'Go to next diagnostic message' }
)
vim.keymap.set(
    'n',
    '<leader>i',
    vim.diagnostic.open_float,
    { desc = 'Open floating diagnostic message' }
)
-- vim.keymap.set('n', '<leader>E', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.api.nvim_create_user_command(
    'Scrollbind',
    'windo set scrollbind!',
    { desc = 'scrollbind every window', force = false }
)
