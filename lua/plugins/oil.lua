-- File Explorer plugin
return {
    'stevearc/oil.nvim',
    opts = {
        columns = {
            'permissions',
            'size',
            'type',
        },
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
        -- Additionally, if it is a string that matches "actions.<name>",
        -- it will use the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
            ['<C-t>'] = false,
            ['cd'] = 'actions.tcd',
            ['`'] = false,
            ['~'] = false,
            ['g.'] = false,
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = true,
        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true,
            -- This function defines what is considered a "hidden" file
            is_hidden_file = function(name, bufnr)
                return vim.startswith(name, '.')
            end,
            -- This function defines what will never be shown, even when `show_hidden` is set
            is_always_hidden = function(name, bufnr)
                return false
            end,
            sort = {
                -- sort order can be "asc" or "desc"
                -- see :help oil-columns to see which columns are sortable
                { 'type', 'asc' },
                { 'name', 'asc' },
            },
        },
    },
}
