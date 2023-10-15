-- "gc" to comment visual regions/lines
return {
    'numToStr/Comment.nvim',
    opts = {
        mapping = {
            basic = false,
            extra = false,
        },
        toggler = {
            line = '<leader>q',
        },
        opleader = {
            line = '<leader>q',
            block = '<leader>aq',
        },
    },
}
