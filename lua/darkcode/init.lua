local darkcode = {}
local theme = require('darkcode.theme')

darkcode.setup = function(user_opts)
    local defaults = {
        transparent = false,
        italic_comments = true,
        italic_keywords = true,
        color_overrides = {},
        group_overrides = {},
        disable_nvimtree_bg = true,
    }

    -- but override global vars settings with setup() settings
    local opts = vim.tbl_extend('force', defaults, user_opts)

    -- setting transparent to true removes the default background
    if opts.transparent then
        opts.color_overrides.vscBack = 'NONE'
    end

    vim.cmd('hi clear')
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end

    vim.o.termguicolors = true
    vim.g.colors_name = 'darkcode'

    theme.set_highlights(opts)
    theme.link_highlight()

    for group, val in pairs(opts['group_overrides']) do
        vim.api.nvim_set_hl(0, group, val)
    end
end

darkcode.change_style = function(style)
    vim.o.background = style
    print('Darkcode style: ', style)
    vim.cmd([[colorscheme darkcode]])
end

return darkcode
