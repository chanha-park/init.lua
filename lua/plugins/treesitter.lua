return {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    -- [[ Configure Treesitter ]]
    -- See `:help nvim-treesitter`
    config = function()
        local isdisabled = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats =
                pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end
        require('nvim-treesitter.configs').setup({
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
            ignore_install = { 'javascript' },

            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
            auto_install = false,

            highlight = {
                enable = true,
                disable = isdisabled,

                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
                disable = isdisabled,
            },
            incremental_selection = {
                enable = true,
                disable = isdisabled,

                keymaps = {
                    init_selection = false,
                    node_incremental = '<C-n>',
                    scope_incremental = false,
                    node_decremental = '<C-p>',
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    disable = isdisabled,

                    -- Automatically jump forward to textobjects, similar to targets.vim
                    lookahead = true,

                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['aa'] = '@parameter.outer', -- mnemonic: argument
                        ['ia'] = '@parameter.inner', -- mnemonic: argument
                        ['ac'] = '@comment.outer',
                        -- ["ac"] = "@class.outer",
                        -- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
                        -- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                    },
                    -- You can choose the select mode (default is charwise 'v')
                    -- selection_modes = {
                    --     ['@parameter.outer'] = 'v', -- charwise
                    --     ['@function.outer'] = 'V', -- linewise
                    --     ['@class.outer'] = '<c-v>', -- blockwise
                    -- },
                },

                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>l'] = '@parameter.inner',
                    },
                    swap_previous = {
                        ['<leader>h'] = '@parameter.inner',
                    },
                },
            },
        })
    end,
}
