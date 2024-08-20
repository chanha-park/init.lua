-- formatting setting

return {
    'mhartington/formatter.nvim',
    opts = function()
        -- Utilities for creating configurations
        local util = require('formatter.util')
        vim.keymap.set('n', '<leader>w', ':FormatWrite<CR>', { silent = true })
        vim.api.nvim_create_autocmd('BufWritePost', {
            group = vim.api.nvim_create_augroup(
                '_formatterPlugin',
                { clear = true }
            ),
            pattern = '*',
            command = 'FormatWrite',
        })

        -- local lsp_as_default_formatter = function()
        --     -- Ignore already configured types.
        --     local defined_types = require('formatter.config').values.filetype
        --     if defined_types[vim.bo.filetype] ~= nil then
        --         return nil
        --     end
        --     vim.lsp.buf.format({ async = true })
        -- end

        return {
            logging = false,
            filetype = {
                lua = {
                    function()
                        -- Full specification of configurations is down below and in Vim help
                        -- files
                        return {
                            exe = 'stylua',
                            args = {
                                '--search-parent-directories',
                                '--stdin-filepath',
                                util.escape_path(
                                    util.get_current_buffer_file_path()
                                ),
                                '--',
                                '-',
                            },
                            stdin = true,
                        }
                    end,
                },

                c = { require('formatter.defaults.clangformat') },
                cpp = { require('formatter.defaults.clangformat') },
                tablegen = { require('formatter.defaults.clangformat') },

                haskell = {
                    function()
                        vim.lsp.buf.format({ async = true })
                    end,
                },

                python = { require('formatter.filetypes.python').black },

                asm = {
                    function()
                        return {
                            exe = 'asmfmt',
                            stdin = true,
                        }
                    end,
                },

                rust = {
                    -- Rustfmt
                    function()
                        return {
                            exe = 'rustfmt',
                            args = { '--emit=stdout', '--edition 2021' },
                            stdin = true,
                        }
                    end,
                },

                -- Use the special "*" filetype for defining formatter configurations on
                -- any filetype
                ['*'] = {
                    require('formatter.filetypes.any').remove_trailing_whitespace,
                },
            },
        }
    end,
}
