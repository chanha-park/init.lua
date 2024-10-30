-- [[ Setting options ]]
-- See `:help vim.o`

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 999

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.ruler = true
vim.opt.title = true
vim.opt.cursorline = true
vim.opt.colorcolumn = '80'
vim.opt.signcolumn = 'number'

vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.wildignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.grepprg = 'rg --vimgrep'
-- vim.opt.matchpairs:append { '<:>' }

vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

vim.opt.wrap = false

vim.opt.signcolumn = 'number'

-- Decrease update time
-- vim.opt.updatetime = 250
-- vim.opt.timeoutlen = 300

vim.opt.path:append('**')
vim.opt.wildmenu = true
vim.opt.tags:append('tags;~')
vim.opt.laststatus = 3

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { 'menu', 'popup', 'menuone' }

vim.opt.list = true
vim.opt.listchars = { eol = '$', tab = '|.', trail = '-' }

vim.opt.encoding = 'utf-8'

-- vim.opt.autochdir = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.termguicolors = true
-- vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'
-- vim.g.netrw_keep_dir = 0

-- increment/decrement alphabet by Ctrl-a, Ctrl-x
vim.opt.nrformats:append('alpha')

vim.opt.formatoptions:append('/')

-- save undo history. cf) `:set undodir?`
vim.opt.undofile = false

-- vim.opt.spell = true
-- vim.opt.spelllang = 'en_us'
vim.opt.spelloptions = { 'camel', 'noplainbuffer' }
vim.opt.spellsuggest = { 'fast' }
