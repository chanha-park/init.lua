return {
    'stevearc/overseer.nvim',
    opts = function()
        vim.keymap.set(
            'n',
            '<leader>osr',
            ':OverseerRun<CR>',
            { desc = 'run :OverseerRun command' }
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
                        'open_output',
                        on_complete = 'failure',
                        on_result = 'if_diagnostics',
                        on_start = 'always',
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
