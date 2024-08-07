return {
    { 'samjwill/nvim-unception' },
    {
        'neovimhaskell/haskell-vim',
        config = function()
            -- to enable highlighting of forall
            vim.g.haskell_enable_quantification = 1

            -- to enable highlighting of `mdo` and `rec`
            vim.g.haskell_enable_recursivedo = 1

            -- to enable highlighting of proc
            vim.g.haskell_enable_arrowsyntax = 1

            -- to enable highlighting of pattern
            vim.g.haskell_enable_pattern_synonyms = 1

            -- to enable highlighting of type roles
            vim.g.haskell_enable_typeroles = 1

            -- to enable highlighting of static
            vim.g.haskell_enable_static_pointers = 1

            -- to enable highlighting of backpack keywords
            vim.g.haskell_backpack = 1

            vim.g.haskell_indent_if = 3
            vim.g.haskell_indent_case = 2
            vim.g.haskell_indent_let = 4
            vim.g.haskell_indent_where = 6
            vim.g.haskell_indent_before_where = 2
            vim.g.haskell_indent_after_bare_where = 2
            vim.g.haskell_indent_do = 3
            vim.g.haskell_indent_in = 1
            vim.g.haskell_indent_guard = 2
        end,
        ft = 'haskell',
    },
    { 'ionide/Ionide-vim' },
}
