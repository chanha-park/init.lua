return {
    'stevearc/overseer.nvim',
    opts = function()
        vim.keymap.set(
            'n',
            '<C-k><C-f>',
            ':OverseerRun<CR>',
            { desc = 'run :OverseerRun command' }
        )
        vim.keymap.set(
            'n',
            '<C-k><C-r>',
            ':OverseerQuickAction restart<CR>',
            { desc = 'run :OverseerQuickAction restart command' }
        )
        vim.keymap.set(
            'n',
            '<C-k><C-t>',
            ':OverseerToggle!<CR>',
            { desc = 'run :OverseerToggle command' }
        )
        return {
            templates = { 'builtin', 'cmake.build', 'cmake.generate' },
            dap = false,
            component_aliases = {
                -- default = {
                --     { 'display_duration', detail_level = 2 },
                --     'on_output_summarize',
                --     'on_exit_set_status',
                --     'on_complete_notify',
                --     {
                --         'on_complete_dispose',
                --         require_view = { 'SUCCESS', 'FAILURE' },
                --     },
                -- },
                my_cmake_default = {
                    {
                        'on_complete_notify',
                        system = 'unfocused',
                    },
                    {
                        'open_output',
                        on_complete = 'failure',
                        on_result = 'if_diagnostics',
                        -- on_start = 'always',
                    },
                    {
                        'on_output_quickfix',
                        close = true,
                        items_only = true,
                        tail = false,
                    },
                    'unique',
                    'default',
                },
            },
        }
    end,
}
