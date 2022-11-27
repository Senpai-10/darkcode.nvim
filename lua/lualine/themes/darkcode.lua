local darkcode = {}
local colors = {}

colors.bg = '#262626'
colors.bg2 = '#373737'
colors.fg = '#ffffff'
colors.red = '#f44747'
colors.green = '#4EC9B0'
colors.blue = '#0a7aca'
colors.lightblue = '#5CB6F8'
colors.yellow = '#ffaf00'
colors.pink = '#DDB6F2'

darkcode.normal = {
    b = { fg = colors.blue, bg = colors.bg2 },
    a = { fg = vim.o.background == 'dark' and colors.fg or colors.bg, bg = colors.blue, gui = 'bold' },
    c = { fg = colors.fg, bg = colors.bg },
}

darkcode.visual = {
    a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
    b = { fg = colors.yellow, bg = colors.bg2 },
}

darkcode.inactive = {
    b = { fg = colors.bg, bg = colors.fg },
    a = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
}

darkcode.replace = {
    b = { fg = colors.red, bg = colors.bg2 },
    a = { fg = vim.o.background == 'dark' and colors.bg or colors.fg, bg = colors.red, gui = 'bold' },
    c = { fg = colors.fg, bg = colors.bg },
}

darkcode.insert = {
    a = { fg = vim.o.background == 'dark' and colors.bg or colors.fg, bg = colors.green, gui = 'bold' },
    b = { fg = colors.green, bg = colors.bg2 },
    c = { fg = colors.fg, bg = colors.bg },
}

darkcode.command = {
    b = { fg = colors.pink, bg = colors.bg2 },
    a = { fg = vim.o.background == 'dark' and colors.bg or colors.fg, bg = colors.pink, gui = 'bold' },
    c = { fg = colors.fg, bg = colors.bg },
}

return darkcode
