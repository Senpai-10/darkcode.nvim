local darkcode = {}
local theme = require('darkcode.theme')

darkcode.setup = function(user_opts)
    local defaults = {
        transparent = false,
        italic_comments = true,
        color_overrides = {},
        group_overrides = {},
        disable_nvimtree_bg = true,
    }

    -- backwards compatibility: let users still set settings with global vars
    local global_settings_opts = vim.tbl_extend('force', defaults, {
        transparent = (vim.g.darkcode_transparent == true
                       or vim.g.darkcode_transparent == 1),
        italic_comments = (vim.g.darkcode_italic_comment == true
                           or vim.g.darkcode_italic_comment == 1),
        disable_nvimtree_bg = (vim.g.darkcode_disable_nvim_tree_bg == true
                               or vim.g.darkcode_disable_nvim_tree_bg == 1),
    })

    -- but override global vars settings with setup() settings
    local opts = vim.tbl_extend('force', global_settings_opts, user_opts)

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
