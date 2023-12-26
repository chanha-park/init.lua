return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
        options = {
            icons_enabled = false,
            theme = 'auto',
            component_separators = '',
            section_separators = '',
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnotics' },
            lualine_c = {
                {
                    'filename',
                    file_status = true,
                    path = 1,
                    shorting_target = 40,
                },
                '%B',
            },
            lualine_x = { 'encoding', 'filetype', 'fileformat' },
            lualine_y = { 'location' },
            lualine_z = { 'progress' },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {
            lualine_a = { 'tabs' },
            lualine_b = { 'buffers' },
        },
        extensions = { 'man', 'oil' },
    },
}
