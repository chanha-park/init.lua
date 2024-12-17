-- Fuzzy Finder (files, lsp, etc)
return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
    },
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    opts = function()
        -- Enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')

        local telescope_builtin = require('telescope.builtin')

        -- See `:help telescope.builtin`
        vim.keymap.set(
            'n',
            '<leader>fo',
            telescope_builtin.oldfiles,
            { desc = '[F]ind [O]ldfiles' }
        )
        vim.keymap.set(
            'n',
            '<leader>fb',
            telescope_builtin.buffers,
            { desc = '[ ] Find existing buffers' }
        )
        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            telescope_builtin.current_buffer_fuzzy_find(
                require('telescope.themes').get_dropdown({
                    winblend = 10,
                    previewer = false,
                })
            )
        end, { desc = '[/] Fuzzily search in current buffer' })

        -- vim.keymap.set(
        --     'n',
        --     '<leader>cc',
        --     telescope_builtin.commands,
        --     { desc = 'Search nvim [C]ommand mode [C]ommands' }
        -- )
        vim.keymap.set(
            'n',
            '<leader>fq',
            telescope_builtin.quickfix,
            { desc = '[F]ind [Q]uickFix' }
        )
        vim.keymap.set(
            'n',
            '<leader>ff',
            telescope_builtin.find_files,
            { desc = '[F]ind [F]iles' }
        )
        vim.keymap.set('n', '<leader>fd', function()
            telescope_builtin.diagnostics({
                -- severity = vim.diagnostic.severity.ERROR,
            })
        end, { desc = '[F]ind [D]ignostics' })
        vim.keymap.set(
            'n',
            '<leader>fw',
            telescope_builtin.grep_string,
            { desc = '[F]ind current [W]ord' }
        )
        vim.keymap.set(
            'n',
            '<leader>fg',
            telescope_builtin.live_grep,
            { desc = '[F]ind [G]rep' }
        )
        vim.keymap.set(
            'n',
            '<leader>fj',
            telescope_builtin.jumplist,
            { desc = '[F]ind [j]umplist' }
        )

        return {
            defaults = {
                path_display = {
                    shorten = {
                        len = 3,
                        exclude = { -2, -1 },
                    },
                },
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    },
                    n = {
                        ['<C-u>'] = 'results_scrolling_up',
                        ['<C-d>'] = 'results_scrolling_down',
                        ['dd'] = 'delete_buffer',
                    },
                },
            },
        }
    end,
}
